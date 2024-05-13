using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour
{
    [SerializeField] private GameObject policeCap = null;
    [SerializeField] private GameObject thieveCap = null;
    [SerializeField] private GameObject caughtParticle = null;

    private GameObject collectedItem = null;
    private string role = null;
    private GameObject destroyingItem = null;

    private GameManager gameManager;

    private void Start()
    {
        gameManager = GameManager.Instance;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (role == null)
        {
            if (collision.gameObject.CompareTag("ThievesButton"))
                OnSelectRole("Thieves");
            else if (collision.gameObject.CompareTag("PoliceButton"))
                OnSelectRole("Police");

            return;
        }

        if (role == "Thieves")
        {
            if (collision.gameObject == collectedItem)
                return;

            string tag = collision.gameObject.tag;

            if (tag == "ThievesItem" && transform.childCount == 0)
                Collect(collision);

            else if (tag == "Platform" && collectedItem != null && transform.childCount > 0)
                Put(collision);
        }
        else if (role == "Police")
        {
            if (collision.gameObject.name == "Thieves" && collision.transform.childCount > 0)
            {
                Debug.Log("Collide with Thieves");
                collision.gameObject.GetComponent<PlayerController>().ThievesCaught();

                StartCoroutine(WinRoutine());
            }
        }
    }

    private IEnumerator WinRoutine()
    {
        yield return new WaitForSeconds(1);

        gameManager.WinPanel.SetActive(true);

        yield return new WaitForSeconds(3);

        RemoveRole();
    }

    private void OnSelectRole(string _role)
    {
        gameObject.name = _role;
        role = _role;

        if (role == "Police")
        {
            policeCap.SetActive(true);
            int test = 1 << 9;
            int result = ~test;
            Camera.main.cullingMask &= result;

        }
        else if (role == "Thieves")
        {
            thieveCap.SetActive(true);
            gameManager.QuestPanel.SetActive(true);
        }
    }

    private void RemoveRole()
    {
        policeCap.SetActive(false);
        thieveCap.SetActive(false);
        gameManager.QuestPanel.SetActive(false);
        gameManager.WinPanel.SetActive(false);
        gameManager.LosePanel.SetActive(false);
        role = null;
        gameObject.name = "NewCharacter";
    }

    private void Collect(Collision collision)
    {
        Debug.Log("collect");
        collision.transform.parent.GetComponent<ThievesItem>().Reproduce();

        collision.transform.parent = transform;
        collision.transform.localPosition = new Vector3(0.03f, 0.05f, 0.29f);
        collectedItem = collision.gameObject;
    }

    private void Put(Collision collision)
    {
        collectedItem.transform.parent = collision.transform;
        collectedItem.transform.localPosition = Vector3.zero;
        collectedItem.transform.localScale += (Vector3.one - collectedItem.transform.parent.transform.localScale);
        destroyingItem = collectedItem;
        collectedItem.tag = "DestroyedThievesItem";
        Animator itemAnimator = collectedItem.GetComponent<Animator>();
        itemAnimator.Play("CrystalDestroy", 0);
        StartCoroutine(DestroyItemAfterDelay(collectedItem));
    }

    private IEnumerator DestroyItemAfterDelay(GameObject item)
    {
        yield return new WaitForSeconds(2);
        Destroy(item);
    }

    public void ThievesCaught()
    {
        Debug.Log("Caught Thieves");
        caughtParticle.SetActive(true);
        StartCoroutine(LoseRoutine());
    }

    private IEnumerator LoseRoutine()
    {
        yield return new WaitForSeconds(0.5f);

        transform.parent.localPosition = Vector3.zero;

        caughtParticle.SetActive(false);

        if (transform.childCount > 0)
            Destroy(transform.GetChild(0).gameObject);

        gameManager.LosePanel.SetActive(true);

        yield return new WaitForSeconds(3);

        RemoveRole();
    }


}
