using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeepTest : MonoBehaviour
{
    [SerializeField]
    private Camera camera;
    [SerializeField]
    private LayerMask layers;
        

    private void Awake()
    {
        camera = Camera.main;
        int test = 1 << 9;
        int result = ~test;
        camera.cullingMask &= result;


       // test.cullingMask = 
    }
}
