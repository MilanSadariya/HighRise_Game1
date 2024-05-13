using UnityEngine;

public class Arrow : MonoBehaviour
{
    void Update()
    {
        // Calculate the target position relative to the parent's position
        Vector3 targetPosition = Vector3.zero - transform.parent.localPosition;

        // Set the forward direction of the object to face the target position (ignoring the y-axis)
        transform.forward = new Vector3(targetPosition.x, 0f, targetPosition.z);
    }
}
