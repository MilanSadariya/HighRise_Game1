using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixedJoystick : Joystick
{
    public static Joystick Instance;

    private void Awake()
    {
        if (Instance != this)
            Instance = this;
    }
    private void Update()
    {
        Debug.Log(Direction.normalized);
    }
}