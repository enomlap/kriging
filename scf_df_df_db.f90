!        Generated by TAPENADE     (INRIA, Tropics team)
!  Tapenade 3.4 (r3375) - 10 Feb 2010 15:08
!
!  Differentiation of scf_df_df in forward (tangent) mode:
!   variations   of useful results: vdd
!   with respect to varying inputs: xb
!   RW status of diff variables: xb:in vdd:out
!        Generated by TAPENADE     (INRIA, Tropics team)
!  Tapenade 3.4 (r3375) - 10 Feb 2010 15:08
!
!  Differentiation of scf_df in forward (tangent) mode:
!   variations   of useful results: vd
!   with respect to varying inputs: xf
!   RW status of diff variables: xf:in vd:out
!        Generated by TAPENADE     (INRIA, Tropics team)
!  Tapenade 3.4 (r3375) - 10 Feb 2010 15:08
!
!  Differentiation of scf in forward (tangent) mode:
!   variations   of useful results: v
!   with respect to varying inputs: xf
!   RW status of diff variables: v:out xf:in
SUBROUTINE SCF_DF_DF_DB(iscf, hstat, xf, xfd0, xfd, xb, xbd, tt, pp, v, &
&  vd, vdd, vddd)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: iscf, hstat
  DOUBLE PRECISION, INTENT(IN) :: xf, xb, tt, pp
  DOUBLE PRECISION, INTENT(IN) :: xbd
  DOUBLE PRECISION, INTENT(IN) :: xfd0
  DOUBLE PRECISION, INTENT(IN) :: xfd
  DOUBLE PRECISION, INTENT(OUT) :: v
  DOUBLE PRECISION, INTENT(OUT) :: vd
  DOUBLE PRECISION, INTENT(OUT) :: vdd
  DOUBLE PRECISION, INTENT(OUT) :: vddd
  DOUBLE PRECISION :: xx
  DOUBLE PRECISION :: xxd1
  DOUBLE PRECISION :: xxd0
  DOUBLE PRECISION :: xxd
  DOUBLE PRECISION :: arg1
  DOUBLE PRECISION :: arg1d1
  DOUBLE PRECISION :: arg1d0
  DOUBLE PRECISION :: arg1d0d
  DOUBLE PRECISION :: arg1d
  DOUBLE PRECISION :: arg1dd0
  DOUBLE PRECISION :: arg1dd
  REAL :: result1
  REAL :: result2
  INTRINSIC EXP
  INTRINSIC DABS
  INTRINSIC SQRT
  IF (xf - xb .GE. 0.) THEN
    xxd = xfd
    xxd0 = xfd0
    xxd1 = -xbd
    xx = xf - xb
  ELSE
    xxd = -xfd
    xxd0 = -xfd0
    xxd1 = xbd
    xx = -(xf-xb)
  END IF
  IF (iscf .EQ. 0) THEN
! Gaussian
    IF (pp .NE. 2.d0) THEN
      STOP
    ELSE
      arg1dd = -(tt*2.d0*xxd*xxd0)
      arg1dd0 = -(tt*2.d0*xxd*xxd1)
      arg1d = -(tt*2.d0*xx*xxd)
      arg1d0d = -(tt*2.d0*xxd0*xxd1)
      arg1d0 = -(tt*2.d0*xx*xxd0)
      arg1d1 = -(tt*2.d0*xx*xxd1)
      arg1 = -(1.d0*tt*xx**2.d0)
      vddd = arg1dd*arg1d1*EXP(arg1) + (arg1dd0*arg1d0+arg1d*arg1d0d)*&
&        EXP(arg1) + arg1d*arg1d0*arg1d1*EXP(arg1)
      vdd = arg1dd*EXP(arg1) + arg1d*arg1d0*EXP(arg1)
      vd = arg1d*EXP(arg1)
      v = EXP(arg1)
    END IF
  ELSE IF (iscf .EQ. 2) THEN
! Cubic Spline
    IF (xx .LT. 1.d0/(2.d0*tt)) THEN
      vddd = 6.d0*3*tt**3*xxd*2*xxd0*xxd1
      vdd = 6.d0*3*tt**3*xxd*2*xx*xxd0 - 6.d0*2*tt**2*xxd*xxd0
      vd = 6.d0*3*xx**2*tt**3*xxd - 6.d0*2*xx*tt**2*xxd
      v = 1.d0 - 6.d0*(xx*tt)**2 + 6.d0*(xx*tt)**3
    ELSE IF (xx .GE. 1.d0/(2.d0*tt) .AND. xx .LT. 1.d0/tt) THEN
      vddd = -(2.d0*3*tt**3*xxd*2*xxd0*xxd1)
      vdd = 2.d0*3*tt**2*xxd*2*(1.d0-xx*tt)*xxd0
      vd = -(2.d0*3*(1.d0-xx*tt)**2*tt*xxd)
      v = 2.d0*(1.d0-xx*tt)**3
    ELSE IF (xx .GE. 1.d0/tt) THEN
      v = 0.d0
      vd = 0.d0
      vdd = 0.d0
      vddd = 0.D0
    ELSE
      vd = 0.d0
      vdd = 0.d0
      vddd = 0.D0
    END IF
  ELSE IF (iscf .EQ. 3) THEN
! Wendland C2
    IF (xx .LE. 1.d0/tt) THEN
      vddd = 4.d0*tt**3*xxd*4*xxd0*3*(1.d0-tt*xx)**2*xxd1 - 4*tt*xxd*(-(&
&        4.d0*tt**2*xxd0*3*(1.d0-tt*xx)**2*xxd1)-3*tt*xxd0*((1.d0-tt*xx)&
&        **2*4.d0*tt*xxd1-2*(1.d0-tt*xx)*tt*xxd1*(4.d0*tt*xx+1.d0)))
      vdd = -(4.d0*tt**2*xxd*4*(1.d0-tt*xx)**3*xxd0) - 4*tt*xxd*((1.d0-&
&        tt*xx)**3*4.d0*tt*xxd0-3*(1.d0-tt*xx)**2*tt*xxd0*(4.d0*tt*xx+&
&        1.d0))
      vd = (1.d0-tt*xx)**4*4.d0*tt*xxd - 4*(1.d0-tt*xx)**3*tt*xxd*(4.d0*&
&        tt*xx+1.d0)
      v = (1.d0-tt*xx)**4*(4.d0*tt*xx+1.d0)
    ELSE
      v = 0.d0
      vd = 0.d0
      vdd = 0.d0
      vddd = 0.D0
    END IF
  ELSE IF (iscf .EQ. 4) THEN
! Wendland C4
    IF (xx .LE. 1.d0/tt) THEN
      vddd = (-(35.d0*2*tt**3*xxd*xxd0*6*(1.d0-tt*xx)**5*xxd1)-6*tt*xxd0&
&        *((1.d0-tt*xx)**5*35.d0*2*tt**2*xxd*xxd1-5*(1.d0-tt*xx)**4*tt*&
&        xxd1*(35.d0*2*tt**2*xx*xxd+18.d0*tt*xxd))-6*tt*xxd*((1.d0-tt*xx)&
&        **5*35.d0*2*tt**2*xxd0*xxd1-5*(1.d0-tt*xx)**4*tt*xxd1*(35.d0*2*&
&        tt**2*xx*xxd0+18.d0*tt*xxd0)-5*tt*xxd0*((1.d0-tt*xx)**4*(35.d0*2&
&        *tt**2*xx*xxd1+18.d0*tt*xxd1)-4*(1.d0-tt*xx)**3*tt*xxd1*(35.d0*(&
&        tt*xx)**2+18.d0*tt*xx+3.d0))))/3.d0
      vdd = ((1.d0-tt*xx)**6*35.d0*2*tt**2*xxd*xxd0-6*(1.d0-tt*xx)**5*tt&
&        *xxd0*(35.d0*2*tt**2*xx*xxd+18.d0*tt*xxd)-6*tt*xxd*((1.d0-tt*xx)&
&        **5*(35.d0*2*tt**2*xx*xxd0+18.d0*tt*xxd0)-5*(1.d0-tt*xx)**4*tt*&
&        xxd0*(35.d0*(tt*xx)**2+18.d0*tt*xx+3.d0)))/3.d0
      vd = ((1.d0-tt*xx)**6*(35.d0*2*tt**2*xx*xxd+18.d0*tt*xxd)-6*(1.d0-&
&        tt*xx)**5*tt*xxd*(35.d0*(tt*xx)**2+18.d0*tt*xx+3.d0))/3.d0
      v = (1.d0-tt*xx)**6*(35.d0*(tt*xx)**2+18.d0*tt*xx+3.d0)/3.d0
    ELSE
      v = 0.d0
      vd = 0.d0
      vdd = 0.d0
      vddd = 0.D0
    END IF
  ELSE IF (iscf .EQ. 5) THEN
! Matern function
    IF (hstat .EQ. 0) THEN
!nu=1/2
      vddd = -(tt**3*xxd*xxd0*xxd1*EXP(-(tt*xx)))
      vdd = tt**2*xxd*xxd0*EXP(-(tt*xx))
      vd = -(tt*xxd*EXP(-(tt*xx)))
      v = EXP(-(tt*xx))
    ELSE IF (hstat .EQ. 1) THEN
!nu=3/2
      result1 = SQRT(3.0)
      result2 = SQRT(3.0)
      arg1d = -(result2*tt*xxd)
      arg1d0 = -(result2*tt*xxd0)
      arg1d1 = -(result2*tt*xxd1)
      arg1 = -(result2*tt*xx)
      vddd = result1*tt*xxd*arg1d0*arg1d1*EXP(arg1) + arg1d*(result1*tt*&
&        xxd0*arg1d1*EXP(arg1)+arg1d0*(result1*tt*xxd1*EXP(arg1)+(1.0+&
&        result1*tt*xx)*arg1d1*EXP(arg1)))
      vdd = result1*tt*xxd*arg1d0*EXP(arg1) + arg1d*(result1*tt*xxd0*EXP&
&        (arg1)+(1.0+result1*tt*xx)*arg1d0*EXP(arg1))
      vd = result1*tt*xxd*EXP(arg1) + (1.0+result1*tt*xx)*arg1d*EXP(arg1&
&        )
      v = (1.0+result1*tt*xx)*EXP(arg1)
    ELSE
!nu=5/2
      result1 = SQRT(5.0)
      result2 = SQRT(5.0)
      arg1d = -(result2*tt*xxd)
      arg1d0 = -(result2*tt*xxd0)
      arg1d1 = -(result2*tt*xxd1)
      arg1 = -(result2*tt*xx)
      vddd = 5.0*2*tt**2*xxd*xxd0*arg1d1*EXP(arg1)/3.0 + arg1d0*(5.0*2*&
&        tt**2*xxd*xxd1*EXP(arg1)/3.0+(result1*tt*xxd+5.0*2*tt**2*xx*xxd/&
&        3.0)*arg1d1*EXP(arg1)) + arg1d*(5.0*2*tt**2*xxd0*xxd1*EXP(arg1)/&
&        3.0+(result1*tt*xxd0+5.0*2*tt**2*xx*xxd0/3.0)*arg1d1*EXP(arg1)+&
&        arg1d0*((result1*tt*xxd1+5.0*2*tt**2*xx*xxd1/3.0)*EXP(arg1)+(1.0&
&        +result1*tt*xx+5.0/3.0*(tt*xx)**2)*arg1d1*EXP(arg1)))
      vdd = 5.0*2*tt**2*xxd*xxd0*EXP(arg1)/3.0 + (result1*tt*xxd+5.0*2*&
&        tt**2*xx*xxd/3.0)*arg1d0*EXP(arg1) + arg1d*((result1*tt*xxd0+5.0&
&        *2*tt**2*xx*xxd0/3.0)*EXP(arg1)+(1.0+result1*tt*xx+5.0/3.0*(tt*&
&        xx)**2)*arg1d0*EXP(arg1))
      vd = (result1*tt*xxd+5.0*2*tt**2*xx*xxd/3.0)*EXP(arg1) + (1.0+&
&        result1*tt*xx+5.0/3.0*(tt*xx)**2)*arg1d*EXP(arg1)
      v = (1.0+result1*tt*xx+5.0/3.0*(tt*xx)**2)*EXP(arg1)
    END IF
  ELSE
    STOP
  END IF
END SUBROUTINE SCF_DF_DF_DB

