using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [SerializeField] private float moveSpeed = 5f; // Speed of the player movement
    [SerializeField] private Rigidbody rb; // Reference to the Rigidbody component
    [SerializeField] private Animator animator; // Reference to the animator component

    Vector3 movement; // Vector to store player movement direction

    void Update()
    {
        Vector2 direction = FixedJoystick.Instance.Direction;
        movement = new Vector3(direction.x, 0f, direction.y).normalized;


        FixedJoystick.Instance.GetRadiusTouch();

        if (direction.x !=0 && direction.y != 0)
        {
            animator.SetBool("IsWalk", true);
            Debug.Log("walk");
        }
        else
        {
            animator.SetBool("IsWalk", false);
            Debug.Log("idle");
        }

        Vector3 rotation = new Vector3(direction.x,0f,direction.y);
        transform.forward = Vector3.Slerp(transform.forward, rotation, Time.deltaTime*5);
    }

    void FixedUpdate()
    {
        // Movement
        rb.MovePosition(rb.position + movement * moveSpeed * Time.fixedDeltaTime);
    }
}
