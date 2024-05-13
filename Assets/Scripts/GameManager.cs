using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;
    [SerializeField] private GameObject userInterface = null;
    //private UserInterface ui;

    [SerializeField] public GameObject QuestPanel;
    [SerializeField] public GameObject WinPanel;
    [SerializeField] public GameObject LosePanel;

    private void Awake()
    {
        if (Instance != this)
            Instance = this;
    }
    private void Start()
    {
        //ui = userInterface.GetComponent<UserInterface>();
        // Add any additional initialization code here
    }
}
