using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    [SerializeField] private float moveSpeed = 5f; // Speed of the player movement
    [SerializeField] private CharacterController controller;
    [SerializeField] private float turnSmoothTime;
    private float turnSmoothVelocity;

    private void Update()
    {
        //Vector2 direction = FixedJoystick.Instance.Direction;
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");
        Vector3 direction = new Vector3 (horizontal,0f,vertical).normalized;

        if(direction.magnitude >= 0.1f)
        {
            float targetAngle = Mathf.Atan2(direction.x, direction.z) * Mathf.Rad2Deg /** Camera.main.transform.eulerAngles.y*/;
            float angle = Mathf.SmoothDampAngle(transform.eulerAngles.y, targetAngle, ref turnSmoothVelocity, turnSmoothTime);
            transform.rotation = Quaternion.Euler(0f, angle, 0f);

            //Vector3 moveDirection = Quaternion.Euler(0f, targetAngle, 0f) * Vector3.forward;
            controller.Move(direction.normalized * moveSpeed * Time.deltaTime);
        }
    }
}
