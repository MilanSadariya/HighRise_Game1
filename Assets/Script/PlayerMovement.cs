using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float moveSpeed = 5f; // Speed of the player movement
    public Rigidbody rb; // Reference to the Rigidbody component

    Vector3 movement; // Vector to store player movement direction

    void Update()
    {
        // Input
        float moveHorizontal = Input.GetAxisRaw("Horizontal");
        float moveVertical = Input.GetAxisRaw("Vertical");

        // Calculate movement direction based on input
        movement = new Vector3(moveHorizontal, 0f, moveVertical).normalized;
    }

    void FixedUpdate()
    {
        // Movement
        rb.MovePosition(rb.position + movement * moveSpeed * Time.fixedDeltaTime);
    }
}
