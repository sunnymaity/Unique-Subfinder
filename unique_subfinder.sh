# !/bin/bash


# # check root 
# if [[ ! $( id -u ) -eq 0 ]]
# then  
#     echo "You must be root to run the script "
#     exit 
# fi

target=$1

#check the user give any input or not 
if [ "$target" = "" ]
then
    echo " Usage: $0 <domain-name> "
    exit
    
fi

#check dir created or not 
if [ ! -d $target ]
then    
    mkdir $target
fi

# cd $target
function Enter_back (){

                       echo " "
                        echo -e "\e[93m[1] Enter your command"
                        echo " "
                        echo "[b] Back              "  
                        echo -e "\e[92m" 
                        read -p "select>: " op6
                        echo " "
}




function main () 
{    clear 
     while :
     do
      clear
      echo -e "   " "\e[91m                   _   _ _   _ ___ ___  
                      | | | | \ | |_ _/ _ \ 
                      | | | |  \| || | | | |
                      | |_| | |\  || | |_| |
                       \___/|_| \_|___\__\_\
                                        
         ____  _   _ ____  _____ ___ _   _ ____  _____ ____  
        / ___|| | | | __ )|  ___|_ _| \ | |  _ \| ____|  _ \ 
        \___ \| | | |  _ \| |_   | ||  \| | | | |  _| | |_) |
         ___) | |_| | |_) |  _|  | || |\  | |_| | |___|  _ < 
        |____/ \___/|____/|_|   |___|_| \_|____/|_____|_| \_\ "
                                                        
echo -e "                                                          
                                                               "

echo -e "\e[93m                        coded by @Sunny Maity                                                           
                                     
                                                          " 
echo -e "\e[91m##################################################################"
                                                          

      
      echo -e "\e[93m "
      echo "[1] Automatic Domain finding "
      echo "[2] Manually  Domain finding "
      echo "[3] Directory Bruteforcing   "
      echo "[4] Command line interface   "
      echo "[h] Help                     "
      echo "[q] Quit                     "
      echo -e "\e[92m                    "
      read  -p "select>: " op

     


     case "$op"  in
     1) 

                                echo -e "\e[92m[+] Finding subdomains with Sublister...........\e[92m"
                            
                             python3 set_tools/subdomain_enum/sublist3r/sublist3r.py  -d $target -t 25 -o $target/subdomains.txt
                             echo -e "\e[96m[✔] Done "



                            echo -e "\e[92m[+] Finding subdomains with Assetfinder...........\e[92m"
                            set_tools/subdomain_enum/assetfinder/./assetfinder  --subs-only $target >> $target/assetfinder.txt
                            echo -e "\e[96m[✔] Done "


                            echo -e "\e[92m[+] Finding subdomains with subfinder.............\e[91m" 
                            subfinder -silent -d  $target >> $target/subdomains.txt
                            echo -e "\e[96m[✔] Done "

                            echo -e "\e[92m[+] Finding subdomains with findomain.............\e[92m"
                            set_tools/subdomain_enum/findomain/findomain-linux -t $target >> $target/subdomains.txt
                             echo -e "\e[96m[✔] Done "

                            echo -e "\e[92m[+] Finding subdomains with amass.................\e[93m"
                            sudo amass  enum -d $target >>  $target/subdomains.txt
                            


                            echo -e "\e[92m[+] finding subdomains with subscraper............\e[91m"
                            python3  set_tools/subdomain_enum/subscraper/subscraper.py  $target | tee -a  
                            cat subscraper_report.txt >> $target/subdomains.txt
                            rm -rf subscraper_report.txt 


                            echo -e "\e[92m[+] finding subdom with knockpy..............\e[91m"
                            sudo set_tools/subdomain_enum/knockpy/knockpy/./knockpy.py $target 


                            echo -e "\e[92m[+] sorting and filtering............................\e[92m"
                            cat $target/subdomains.txt | sort | uniq > $target/filter_subdomains.txt
                            echo ""
                            echo -e "\e[96m[✔] Done "


                            # Check the domain alive or not 
                            echo " "
                            echo -e "\e[92m[+] check live alive domains with httprobe...........\e[92m"
                            cat $target/filter_subdomains.txt | httprobe > $target/alive_subdomains.txt
                            echo ""
                            echo -e "\e[96m[✔] Done "
                            
                            while :
                            do 

                            echo -e "\e[92m                    "
                            echo "[b] Back                     "
                            echo -e "\e[92m                    "
                            read  -p "select>: " r

                            
                            case $r in
                            b) echo " "
                            break 
                            ;;
                            
                            *)
                            echo " "
                            echo -e "\e[91m[X]  invalid option, please write a valid number "
                            ;;
                    
                            
                            esac 
                            done




         ;;



     2) while :
     do 
    

                        
         echo -e "\e[93m"
         echo "[1] sublist3r  "
         echo "[2] Assetfinder"
         echo "[3] subfinder  "
         echo "[4] Findomain  "
         echo "[5] Amass      " 
         echo "[6] Subscraper "
         echo "[7] Knockpy    "
         echo "[8] Subbrute   "
         echo "[9] Dnsrecon   "
         echo "[b] back       "
         echo "[q] Quit       "
         echo -e "\e[92m      "
         read -p "select>: " op1
         echo " "
       
        
                            case "$op1" in
                            1)  echo -e "sublist3r opening"
                                echo " "
                                echo -e "\e[92m[+] Finding subdomains with Sublister...........\e[92m"
                                echo " "
                                python3 set_tools/subdomain_enum/sublist3r/sublist3r.py  -d $target -t 25 -o $target/sublist3r.txt
                                echo " "
                                echo -e "\e[92m[*] Subdomains written to ./sublist3r.txt"
                                echo " "
                                sleep 1
                                echo -e "\e[92m[✔] Done "

                                ;;
                                
                            2)  echo " "
                                echo -e "Assetfinder opening"
                                echo " "
                                echo -e "\e[92m[+] Finding subdomains with Assetfinder...........\e[92m"
                                set_tools/subdomain_enum/assetfinder/./assetfinder  --subs-only $target >> $target/assetfinder.txt
                                echo " "
                                echo -e "\e[96m[*] Subdomains written to ./Assetfinder.txt"
                                echo " "
                                sleep 1
                                echo -e "\e[96m[✔] Done "
                            
                            

                                ;;
                            3) 
                                echo -e "subfinder opening "
                                echo ""
                                echo -e "\e[92m[+] Finding subdomains with subfinder.............\e[92m" 
                                subfinder -silent -d  $target >> $target/subfinder.txt
                                echo " "
                                echo -e "\e[96m[*] Subdomains written to ./subfinder.txt "
                                echo " "
                                sleep 1
                                echo -e "\e[96m[✔] Done "
                                ;;
                                    
                             4) 
                                echo ""
                                echo -e "\e[92m[+] Finding subdomains with findomain.............\e[92m"
                                set_tools/subdomain_enum/findomain/findomain-linux -t $target >> $target/findomain.txt
                                echo " "
                                echo -e "\e[96m[*] Subdomains written to ./findomain.txt "
                                echo " "
                                sleep 1
                                echo -e "\e[96m[✔] Done "
                                ;;
                             5) echo -e "\e[92m[+] Finding subdomains with amass.................\e[93m"
                                sudo amass  enum -d $target >>  $target/amass.txt
                                echo " "
                                echo -e "\e[96m[*] Subdomains written to ./amass.txt "
                                echo " "
                                sleep 1
                                echo -e "\e[96m[✔] Done "
                                ;;
 
                             6) 
                                echo " "
                                echo -e "\e[92m[+] finding subdomains with subscraper............\e[91m"
                                python3  set_tools/subdomain_enum/subscraper/subscraper.py  $target | tee -a  
                                cat subscraper_report.txt >> $target/subscraper_report.txt
                                rm -rf subscraper_report.txt 
                                echo " "
                                echo -e "\e[96m[✔] Done "
                                ;;

                            7)  echo " "
                                echo -e "\e[92m[+] finding subdom with knockpy..............\e[91m"
                                sudo set_tools/subdomain_enum/knockpy/knockpy/./knockpy.py $target 
                                echo " "
                                echo -e "\e[96m[*] Subdomains written to ./knockpy.json"
                                echo " "
                                sleep 1
                                echo -e "\e[96m[✔] Done "
                                ;;
                            8)  echo " "  
                                echo -e "\e[92m[+] finding subdom with Subbrute..............\e[91m"
                                echo " "
                                echo -e "\e[96m[*] Subbrute can takes long time , be patience..."

                                set_tools/subdomain_enum/subbrute/./subbrute.py -r set_tools/subdomain_enum/subbrute/resolvers.txt $target >> $target/subbrute.txt 

                                echo " "
                                echo -e "\e[92m[*] Subdomains written to ./subbrute.txt "
                                echo " "
                                sleep 1
                                echo -e "\e[92m[✔] Done "
                                ;;   



                            q)  echo " "
                                echo -e "\e[93m[*] Thanks For Using  Unique Subfinder "
                                echo " "
                                exit 0
                            
                            ;;
                            b)  echo " "
                                echo -e "Back to home "
                                echo " "
                                break
                            ;;
                            *)
                                echo " "
                                echo -e "\e[91m[X]  invalid option, please write a valid number "
                            ;;

                            esac
                            done
                            
      ;;

     3) 
        while :
        do 
        echo " "
        echo -e "\e[93m[1] Dirb   "
        echo -e "[2] Gobuster     "
        echo -e "[3] Dirsearch     "
        echo -e "[b] Back         "
        echo -e "\e[92m"
        read -p "Select>: " op3
        

                           case "$op3" in 
                             1)  
                               echo -e "\e[96m "
                               read -p "Target Website>: " Website
                               echo -e "\e[96mDirb is proceing .....\e[92m"
                               dirb $Website -w wordlist/dirb/common.txt -o $target/dirb_report.txt
                               echo " "
                               echo -e "\e[96m[*] Subdomains written to ./dirb_report.txt "
                               echo " "
                               sleep 1
                               echo -e "\e[96m[✔] Done "
                               ;;

                            2) echo " "
                               echo -e "\e[96m "
                               read -p "Target Website>: " Website
                               echo -e "\e[96mGobuster is proceing .....\e[92m"
                               gobuster dir -u $Website -w wordlist/dirbuster/directory-list-2.3-small.txt -o $target/gobuster_report.txt
                               echo " "
                               echo -e "\e[96m[*] Subdomains written to ./gobuster_report.txt"
                               echo " "
                               sleep 1
                               echo -e "\e[96m[✔] Done "
                               ;;

                            3) 
                               echo -e "\e[96m "
                               read -p "Target Website>: " Website
                               echo -e "\e[96mDirsearch is proceing .....\e[92m"
                               python3 set_tools/subdomain_enum/dirsearch/dirsearch.py -u $Website -w wordlist/dirb/common.txt -o $target/dirsearch_report.txt
                               echo " "
                               echo -e "\e[92m[*] Subdomains written to ./dirsearch_report.txt"
                               echo " "
                               sleep 1
                               echo -e "\e[92m[✔] Done "

                            ;;

                            b)
                             echo " "
                             echo -e "Back to home "
                             echo " "
                             break

                            ;;

                            *) 
                             echo " "
                             echo -e "\e[91m[X]  invalid option, please write a valid number "
                             ;;

                             esac
                             done

                          ;;
     
     
     4)                      
       while :              
       do 
           
               
         echo -e "\e[93m "                              
         echo "[1] sublist3r               [8]  Dirb        "
         echo "[2] Assetfinder             [9]  Subbrute    "
         echo "[3] subfinder               [10] Dnsrecon    "
         echo "[4] Findomain               [11] Gobuster    "
         echo "[5] Subscraper              [12] Dirsearch   "
         echo "[6] Knockpy    "  
         echo "[7] Amass      "
         echo "[b] back       "
         echo -e "\e[92m      "
         read -p "select>: " op5
         echo " "

         case "$op5" in 
 
            1) 
             
                    
                     

                       echo ""
                
                    
                        while :
                        do 
                     

                        Enter_back  
                
                                    case "$op6" in 
                                1)      cd set_tools/subdomain_enum/sublist3r 2>/dev/null
                                        echo -e "\e[96mUsage : python3 sublist3r.py  -d <target> -t   <thread> -o <output-path & save_name> "
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[96m "
                                        $command  
                                        cd .. ; cd .. ; cd .. 
                                        sleep 1
                                       ;;
                                b)
                                       echo -e "\e[96m "
                                       echo -e "Back to home \e[96m"
                                       echo " "
                                       break
                                       
                                      esac
                                      done
                                    
                                      ;;

         
          

            2)
          
 

                        echo ""
                        while :
                        do 
                                 Enter_back  
    
                                    case "$op6" in 
                                1)
                                    echo -e "\e[96mUsage : assetfinder -subs-only <target-domain> "

                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[96m "
                                        $command  
                                        sleep 1
                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 





            3)
               
                        echo ""
                        while :
                        do 
                                 Enter_back  
    
                                    case "$op6" in 
                                1)       
                                        echo -e "\e[96mUsage : subfinder  -d <target-domain> "

                                    
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[96m "
                                        $command  
                                        sleep 1
                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 

         4)            
                        echo ""
                        while :
                        do       
                               
                                 
                                
                                 Enter_back  
    
                                    case "$op6" in 
                                1)      cd set_tools/subdomain_enum/findomain
                                        echo -e "\e[96mUsage : ./findomain-linux -t <target-domain>"

                                    
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[97m "
                                        $command  
                                         cd .. ; cd .. ; cd ..
                                        sleep 1

                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                        
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 

        5)
                        echo ""
   

                        while :
                        do       
                             

                                 Enter_back  
    
                                    case "$op6" in 
                                1)      cd set_tools/subdomain_enum/subscraper 2>/dev/null
                                        echo -e "\e[96mUsage : python3  subscraper.py  <target-domain>"

                                    
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[97m "
                                        $command  
                                        cd .. ; cd .. ; cd .. 
                                        sleep 1
       
                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                 
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 






        6)        echo ""
                       

                        while :
                        do       
                               

                                 Enter_back  
    
                                    case "$op6" in 
                                1)       cd set_tools/subdomain_enum/knockpy/knockpy 2>/dev/null
                                        echo -e "\e[96mUsage : ./knockpy.py <target-domain> "

                                    
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[97m "
                                        $command  
                                        cd .. ; cd .. ; cd .. ; cd ..
                                        sleep 1
          
                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                       
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 
                    


           
        7)

                echo ""
                        

                        while :
                        do       
                               

                                 Enter_back  
    
                                    case "$op6" in 
                                1)       
                                        echo -e "\e[96mUsage : sudo amass  enum -d <domain-name>  "

                                    
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[97m "
                                        $command  
                                        sleep 1

                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 
                    
                       

         8)
                        while :
                        do       
                               

                                 Enter_back  
    
                                    case "$op6" in 
                                1)       
                                        echo -e "\e[96mUsage : dirb <target-url> -w [wordlist-path]  " 
                                        echo " "
                                        echo "dirb-wordlist : /usr/share/wordlist/dirb/common.txt" 

                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[93m "
                                        $command  
                                        sleep 1

                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 





        
        9)
                     

                       echo ""
                
                    
                        while :
                        do 
                       
                        Enter_back  
                
                                    case "$op6" in 
                                1)      cd set_tools/subdomain_enum/subbrute 2>/dev/null
                                        echo -e "\e[96mUsage : ./subbrute.py -r resolvers.txt <target-domain> "
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[96m "
                                        $command 
                                        cd .. ; cd .. ; cd ..  
         
                                        sleep 1
                                       ;;
                                b)
                                       echo -e "\e[96m "
                                       echo -e "Back to home \e[96m"
                                       echo " "
                                     
                                       break
                                       
                                      esac
                                      done
                                    
                                      ;;

                  


        11)        
                      
                        while :
                        do       
                               

                                 Enter_back  
    
                                    case "$op6" in 
                                1)       
                                        echo -e "\e[96mUsage : gobuster dir|dns|dns -u <target-url> -w [wordlist-path] " 
                                        echo " "
                                        echo "go-wordlist :  /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt " 

                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[93m "
                                        $command  
                                        sleep 1

                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 


        12)  
             
                        echo ""
                   
                        while :
                        do       
                               
                                
                                 Enter_back  
    
                                    case "$op6" in 
                                1)      cd set_tools/subdomain_enum/dirsearch 2>/dev/null

                                        echo -e "\e[96mUsage :sudo python3 dirsearch.py [-u] <target-url> [-e|--extensions] -w [wordlist-path] "
                                        echo " "
                                        echo -e "wordlist : /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt "

                                    
                                        echo ""
                                        echo -ne "\e[96mcommand>: \e[92m" ; read command
                                        echo -e "\e[97m "
                                        $command 
                                        cd .. ; cd .. ; cd ..  
                                        sleep 1
                           
                        
                                       ;;
                                b)
                                 
                                         echo -e "\e[96m "
                                         echo -e "Back to home \e[96m"
                                         echo " "
                                     
                                         break
                                                        
                                   
                                    esac
                                    done
                                    ;; 
                    









                    
  



          b)
                echo " "
                echo -e "Back to home "
                echo " "
                break

                ;;  
          *) 
                echo " "
                echo -e "\e[91m[X]  invalid option, please write a valid number "
                           
                ;;


                esac 
                done
            
      ;;

     h)         echo " "
     echo -e $lightgreen "╔──────────────────────────────────────────╗"
     echo -e $lightgreen "|           Author: Bhaskar Maity          |"
     echo -e $lightgreen "|         Unique subfinder Framework       |"
     echo -e $lightgreen "|         Credits to : Sangita Halder      |"
     echo -e $lightgreen "┖──────────────────────────────────────────┙"
     while :
     do 

      
     echo " "
     echo -e "\e[93m[b] Back                                                           "
     echo -e "\e[92m"
     read -p "Select>: " op4



     case "$op4" in 
     b) echo " "
        break
        ;;

     *) 
        echo " "
        echo -e "\e[91m[X]  invalid option, please write a valid number "
        ;;

       esac
       done 
     ;;


     q) echo -e " "        
        echo -e "\e[93m[*] Thanks For Using  Unique Subfinder "
        echo " "
        exit 0
    ;;

     *)
       echo " "
       echo -e "\e[91m[X] invalid option, please write a valid number " 
       sleep 3
    ;;

esac
done
  
     }

main 
















# cat alive_subdomains.txt | massdns > massdns
# # massDns is a dns resolver
# echo -e "[+] Resolving the DNS......."
# read -p "Enter the domain.txt path :" file
# /home/sunny/Documents/master_domain/tools/massdns/bin/massdns -r /home/sunny/Documents/master_domain/tools/massdns/lists/resolvers.txt -o S -w resolver.txt $file
