using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{
    Rigidbody rb;

    float Delay = 0f;
    [SerializeField]
    GameObject OC;
    [SerializeField]
    GameObject TC;
    private bool awwd;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        float x = Input.GetAxisRaw("Horizontal");
        float z = Input.GetAxisRaw("Vertical");

       
       
         Vector3 momo = new Vector3(z, 0, x);
         //momo = Quaternion.AngleAxis(Camera.main.transform.eulerAngles.y, Vector3.up) * momo;
         //momo = Quaternion.AngleAxis(Camera.main.transform.eulerAngles.z, Vector3.forward) * momo;
         rb.AddForce(momo);


        if (Input.GetKeyDown(KeyCode.Space) && Delay <= 0)
        {
            Delay = 5.0f;
            awwd = false;
            StartCoroutine(chageC());
        }
        if(awwd == true)
        {            
            OC.SetActive(true);
            TC.SetActive(false);
        }
        if (Delay >= 0)
        {
            Delay -= Time.deltaTime;
          
        }
    }

    IEnumerator chageC()
    {   
        Debug.Log("asdsad");
        OC.SetActive(false);
        TC.SetActive(true);
        yield return new WaitForSeconds(5f);
        awwd = true;
    }
}
