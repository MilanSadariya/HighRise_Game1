using UnityEngine;
using System.Collections;

public class ThievesItem : MonoBehaviour
{
    [SerializeField] private GameObject item;

    public void Reproduce()
    {
        StartCoroutine(ReproduceAfterDelay());
    }

    private IEnumerator ReproduceAfterDelay()
    {
        yield return new WaitForSeconds(10);

        GameObject newObj = Instantiate(item, transform.position, Quaternion.identity);
        newObj.transform.parent = transform;
        newObj.transform.localPosition = Vector3.zero;
    }
}
