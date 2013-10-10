
    subroutine mirtunableparams(fct,ndim,nhs,ncp,taylororder,NTOEX)
      implicit none
      integer::fct,ndim,taylororder,ncp,nhs,NTOEX
      
      !%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
      !                 EXP
      !%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
      if (Fct.eq.0) then
         if (nhs.le.11)  then  
           NCP=nhs     
           Taylororder=3!nhs!2!2!INT(NHS/4)

        else if (nhs.gt.11 .and. nhs.le.15)  then  
           NCP=10
           Taylororder=5!ncp

        else  if (nhs.gt.15 .and. nhs.le.25)  then  
           NCP=15
           Taylororder=5!ncp
           
        else  if (nhs.gt.25 .and. nhs.le.35)  then  
           NCP=20
           Taylororder=5!ncp
           
        else if (nhs.gt.35 .and. nhs.le.100)  then  
           NCP=20!20+3*ndim
           Taylororder=5
       ! else if (nhs.gt.70 .and. nhs.le.100)  then  
       !   NCP=30!50+0.1*nhs
       !    Taylororder=17       
        else
           NCP=20!+5*ndim
           tAYLORORDER=5
        end if
        NTOEX=(30-ndim)*NCP
     end if
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!    
!                COS
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
     if (Fct.eq.1) then
        if (nhs.le.11)  then  
           NCP=5
           Taylororder=ncp!2!2!INT(NHS/4)
        else if (nhs.gt.11 .and. nhs.le.15)  then  
           NCP=10
           Taylororder=5!ncp

        else if (nhs.gt.15 .and. nhs.le.25)  then  
           NCP=15
           Taylororder=5!ncp

        else if (nhs.gt.25 .and. nhs.le.35)  then  
           NCP=20
           Taylororder=5!ncp

        else if (nhs.gt.35 .and. nhs.le.70)  then  
           NCP=20!50+0.1*nhs
           Taylororder=5
        else if (nhs.gt.70 .and. nhs.le.100)  then  
           NCP=20!50+0.1*nhs
           Taylororder=5       
        else
           NCP=20
           tAYLORORDER=5
        end if
NTOEX=(30-ndim)*NCP
     end if
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
!               RUNGE
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!     
     if (fct.eq.2) then
        if (nhs.le.20)  then  
           NCP=nhs
           Taylororder=5!nhs!2!2!INT(NHS/4)

           !   else if (nhs.gt.11 .and. nhs.le.15)  then  
           !      NCP=nhs
           !      Taylororder=7!ncp
           !      
           !   else if (nhs.gt.15 .and. nhs.le.25)  then  
           !      NCP=nhs
           !      Taylororder=13!ncp
           !      
           !   else if (nhs.gt.25 .and. nhs.le.35)  then  
           !      NCP=nhs
           !      Taylororder=17!ncp
           !      
           !   else if (nhs.gt.35 .and. nhs.le.70)  then  
           !      NCP=30!50+0.1*nhs
           !      Taylororder=17
        else  if (nhs.gt.20 .and. nhs.le.100)  then  
           NCP=20!50+0.1*nhs
           Taylororder=5       
        else
           NCP=20
           tAYLORORDER=5
        end if
NTOEX=(30-ndim)*NCP
     end if
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
!           ROSENBROCK    
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
     if (Fct.eq.3) then
        if (nhs.le.11)  then  
           NCP=5
           Taylororder=ncp!2!2!INT(NHS/4)
        else if (nhs.gt.11 .and. nhs.le.15)  then  
           NCP=10
           Taylororder=5!ncp

        else if (nhs.gt.15 .and. nhs.le.25)  then  
           NCP=15
           Taylororder=5!ncp

        else if (nhs.gt.25 .and. nhs.le.35)  then  
           NCP=25
           Taylororder=5!ncp

        else if (nhs.gt.35 .and. nhs.le.70)  then  
           NCP=35!50+0.1*nhs
           Taylororder=5
        else if (nhs.gt.70 .and. nhs.le.100)  then  
           NCP=50!50+0.1*nhs
           Taylororder=5       
        else
           NCP=70
           tAYLORORDER=5
        end if
NTOEX=(30-ndim)*NCP
     end if
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
!                      CFD   
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!
     if (fct.eq.20) then
        if (nhs.le.10)  then  
           NCP=nhs
           Taylororder=nhs!nhs!2!2!INT(NHS/4)
        else if (nhs.gt.10 .and. nhs.le.15)  then  
           NCP=nhs
           Taylororder=10!ncp
           
        else  if (nhs.gt.15 .and. nhs.le.25)  then  
           NCP=nhs
           Taylororder=10!ncp
           
        else  if (nhs.gt.25 .and. nhs.le.35)  then  
           NCP=nhs
           Taylororder=7!ncp
           
        else if (nhs.gt.35 .and. nhs.le.45)  then  
           NCP=30
           Taylororder=7
           
        else if (nhs.gt.45 .and. nhs.le.100)  then  
           NCP=30!50+0.1*nhs
           Taylororder=7
        else
           NCP=35
           Taylororder=7
           
        end if
        NTOEX=(30-ndim)*NCP

     else


        if (nhs.le.11)  then  
           NCP=5
           Taylororder=ncp!2!2!INT(NHS/4)
        else if (nhs.gt.11 .and. nhs.le.15)  then  
           NCP=10
           Taylororder=5!ncp

        else if (nhs.gt.15 .and. nhs.le.25)  then  
           NCP=15
           Taylororder=5!ncp

        else if (nhs.gt.25 .and. nhs.le.35)  then  
           NCP=20
           Taylororder=5!ncp

        else if (nhs.gt.35 .and. nhs.le.70)  then  
           NCP=20!50+0.1*nhs
           Taylororder=5
        else if (nhs.gt.70 .and. nhs.le.100)  then  
           NCP=20!50+0.1*nhs
           Taylororder=5       
        else
           NCP=20
           tAYLORORDER=5
        end if
        NTOEX=(30-ndim)*NCP


     end if ! end of CFD 



    end subroutine mirtunableparams