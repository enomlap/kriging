!        Generated by TAPENADE     (INRIA, Tropics team)
!  Tapenade 3.4 (r3375) - 10 Feb 2010 15:08
!
!  Differentiation of scf in forward (tangent) mode:
!   variations   of useful results: v
!   with respect to varying inputs: xf
!   RW status of diff variables: v:out xf:in
SUBROUTINE SCF_DF(iscf, hstat, xf, xfd, xb, tt, pp, v, vd)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: iscf, hstat
  DOUBLE PRECISION, INTENT(IN) :: xf, xb, tt, pp
  DOUBLE PRECISION, INTENT(IN) :: xfd
  DOUBLE PRECISION, INTENT(OUT) :: v
  DOUBLE PRECISION, INTENT(OUT) :: vd
  DOUBLE PRECISION :: xx
  DOUBLE PRECISION :: xxd
  DOUBLE PRECISION :: arg1
  DOUBLE PRECISION :: arg1d
  REAL :: result1
  REAL :: result2
  INTRINSIC EXP
  INTRINSIC DABS
  INTRINSIC SQRT
  IF (xf - xb .GE. 0.) THEN
    xxd = xfd
    xx = xf - xb
  ELSE
    xxd = -xfd
    xx = -(xf-xb)
  END IF
  IF (iscf .EQ. 0) THEN
! Gaussian
    IF (pp .NE. 2.d0) THEN
      STOP
    ELSE
      arg1d = -(tt*2.d0*xx*xxd)
      arg1 = -(1.d0*tt*xx**2.d0)
      vd = arg1d*EXP(arg1)
      v = EXP(arg1)
    END IF
  ELSE IF (iscf .EQ. 2) THEN
! Cubic Spline
    IF (xx .LT. 1.d0/(2.d0*tt)) THEN
      vd = 6.d0*3*xx**2*tt**3*xxd - 6.d0*2*xx*tt**2*xxd
      v = 1.d0 - 6.d0*(xx*tt)**2 + 6.d0*(xx*tt)**3
    ELSE IF (xx .GE. 1.d0/(2.d0*tt) .AND. xx .LT. 1.d0/tt) THEN
      vd = -(2.d0*3*(1.d0-xx*tt)**2*tt*xxd)
      v = 2.d0*(1.d0-xx*tt)**3
    ELSE IF (xx .GE. 1.d0/tt) THEN
      v = 0.d0
      vd = 0.D0
    ELSE
      vd = 0.D0
    END IF
  ELSE IF (iscf .EQ. 3) THEN
! Wendland C2
    IF (xx .LE. 1.d0/tt) THEN
      vd = (1.d0-tt*xx)**4*4.d0*tt*xxd - 4*(1.d0-tt*xx)**3*tt*xxd*(4.d0*&
&        tt*xx+1.d0)
      v = (1.d0-tt*xx)**4*(4.d0*tt*xx+1.d0)
    ELSE
      v = 0.d0
      vd = 0.D0
    END IF
  ELSE IF (iscf .EQ. 4) THEN
! Wendland C4
    IF (xx .LE. 1.d0/tt) THEN
      vd = ((1.d0-tt*xx)**6*(35.d0*2*tt**2*xx*xxd+18.d0*tt*xxd)-6*(1.d0-&
&        tt*xx)**5*tt*xxd*(35.d0*(tt*xx)**2+18.d0*tt*xx+3.d0))/3.d0
      v = (1.d0-tt*xx)**6*(35.d0*(tt*xx)**2+18.d0*tt*xx+3.d0)/3.d0
    ELSE
      v = 0.d0
      vd = 0.D0
    END IF
  ELSE IF (iscf .EQ. 5) THEN
! Matern function
    IF (hstat .EQ. 0) THEN
!nu=1/2
      vd = -(tt*xxd*EXP(-(tt*xx)))
      v = EXP(-(tt*xx))
    ELSE IF (hstat .EQ. 1) THEN
!nu=3/2
      result1 = SQRT(3.0)
      result2 = SQRT(3.0)
      arg1d = -(result2*tt*xxd)
      arg1 = -(result2*tt*xx)
      vd = result1*tt*xxd*EXP(arg1) + (1.0+result1*tt*xx)*arg1d*EXP(arg1&
&        )
      v = (1.0+result1*tt*xx)*EXP(arg1)
    ELSE
!nu=5/2
      result1 = SQRT(5.0)
      result2 = SQRT(5.0)
      arg1d = -(result2*tt*xxd)
      arg1 = -(result2*tt*xx)
      vd = (result1*tt*xxd+5.0*2*tt**2*xx*xxd/3.0)*EXP(arg1) + (1.0+&
&        result1*tt*xx+5.0/3.0*(tt*xx)**2)*arg1d*EXP(arg1)
      v = (1.0+result1*tt*xx+5.0/3.0*(tt*xx)**2)*EXP(arg1)
    END IF
  ELSE
    STOP
  END IF
END SUBROUTINE SCF_DF

