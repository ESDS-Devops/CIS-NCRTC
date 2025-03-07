#!/usr/bin/env bash
mainmenu() {
    echo -ne " Enter the OS number of os name of your system from the below list
...OS LIST....
1) RHEL9
2) RHEL8
3) UBUNTU 22
4) SUSE 15
5) UBUNTU 24
0) Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
            echo "Executing the RHEL9"
            ansible-playbook YAML/rhel9.yml -i hosts --private-key SSH-KEYS/id_rsa
        ;;
    2)      echo "Executing the RHEL8"
            ansible-playbook YAML/rhel8.yml -i hosts --private-key SSH-KEYS/id_rsa
        ;;
    3)
            echo "Executing the UBUNTU 22"
            ansible-playbook YAML/ubuntu22.yml -i hosts --private-key SSH-KEYS/id_rsa
         ;;
    4)
            echo "Executing the SUSE 15"
            ansible-playbook YAML/suse15.yml -i hosts --private-key SSH-KEYS/id_rsa
         ;;
    5)
            echo "Executing the UBUNTU 24"
            ansible-playbook YAML/ubuntu24.yml -i hosts --private-key SSH-KEYS/id_rsa
        ;;
    0)
        echo "Please enter right choice.."
        exit 0
        ;;
    *)
        echo "Wrong option."
        exit 1
        ;;
    esac
}
mainmenu
