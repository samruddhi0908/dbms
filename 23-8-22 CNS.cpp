#include<iostream>
#include<ctime>
#include<cstdlib>
using namespace std;
int main()
{
 int nf,N;
 int no_tr=0;
 srand(time(NULL));
 cout<<"Enter the number of frames : ";
 cin>>nf;
 cout<<"Enter the Window Size : ";
 cin>>N;
 int i=1;
 while(i<=nf)
 {
     int x=0;
     for(int j=i;j<i+N && j<=nf;j++)
     {
         cout<<"Sent Frame "<<j<<endl;
         no_tr++;
     }
     for(int j=i;j<i+N && j<=nf;j++)
     {
         int flag = rand()%2;
         if(!flag)
             {
                 cout<<"Acknowledgment for Frame "<<j<<endl;
                 x++;
             }
         else
             {   cout<<"Frame "<<j<<" Not Received"<<endl;
                 cout<<"Retransmitting Window"<<endl;
                 break;
             }
     }
     cout<<endl;
     i+=x;
 }
 cout<<"Total number of transmissions : "<<no_tr<<endl;
 return 0;
}


output:-
  Enter the number of frames : 10
Enter the Window Size : 4
Sent Frame 1
Sent Frame 2
Sent Frame 3
Sent Frame 4
Frame 1 Not Received
Retransmitting Window

Sent Frame 1
Sent Frame 2
Sent Frame 3
Sent Frame 4
Frame 1 Not Received
Retransmitting Window

Sent Frame 1
Sent Frame 2
Sent Frame 3
Sent Frame 4
Acknowledgment for Frame 1
Frame 2 Not Received
Retransmitting Window

Sent Frame 2
Sent Frame 3
Sent Frame 4
Sent Frame 5
Acknowledgment for Frame 2
Acknowledgment for Frame 3
Acknowledgment for Frame 4
Frame 5 Not Received
Retransmitting Window

Sent Frame 5
Sent Frame 6
Sent Frame 7
Sent Frame 8
Frame 5 Not Received
Retransmitting Window

Sent Frame 5
Sent Frame 6
Sent Frame 7
Sent Frame 8
Frame 5 Not Received
Retransmitting Window

Sent Frame 5
Sent Frame 6
Sent Frame 7
Sent Frame 8
Frame 5 Not Received
Retransmitting Window

Sent Frame 5
Sent Frame 6
Sent Frame 7
Sent Frame 8
Acknowledgment for Frame 5
Acknowledgment for Frame 6
Frame 7 Not Received
Retransmitting Window

Sent Frame 7
Sent Frame 8
Sent Frame 9
Sent Frame 10
Frame 7 Not Received
Retransmitting Window

Sent Frame 7
Sent Frame 8
Sent Frame 9
Sent Frame 10
Acknowledgment for Frame 7
Frame 8 Not Received
Retransmitting Window

Sent Frame 8
Sent Frame 9
Sent Frame 10
Acknowledgment for Frame 8
Acknowledgment for Frame 9
Acknowledgment for Frame 10

Total number of transmissions : 43


...Program finished with exit code 0
Press ENTER to exit console.
