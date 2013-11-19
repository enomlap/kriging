subroutine sobol_real(seed,dim_max,npts,rmat)

!*****************************************************************************80
!
!! TEST13 tests I8_SOBOL.
!
!  Discussion:
!
!    In this test, we get a few samples at high dimensions.
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license. 
!
!  Modified:
!
!    28 June 2006
!
!  Author:
!
!    John Burkardt
!
  implicit none

  integer ( kind = 4 ), intent(in) :: dim_max
  integer ( kind = 4 ), intent(in) :: npts
  real    ( kind = 8 ),intent(out) :: rmat(dim_max,npts)

  integer ( kind = 8 ), parameter :: test_num = 3

  integer ( kind = 8 ) dim_num
 ! integer ( kind = 8 ), dimension ( 3 ) :: dim_num_test = (/ 100, 500, 1000 /)
  integer ( kind = 8 ) i
  real ( kind = 8 ), dimension (dim_max) :: r
  integer ( kind = 8 ) seed
  integer ( kind = 8 ) seed_in
  integer ( kind = 8 ) seed_out
!  integer ( kind = 8 ) test

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'TEST13'
  write ( *, '(a)' ) '  I8_SOBOL computes the next element of a Sobol sequence.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  In this test, we get a few samples at high dimension.'
  write ( *, '(a)' ) '  We only print the first and last 2 entries of each'
  write ( *, '(a)' ) '  sample.'

!  do test = 1, test_num

    dim_num = dim_max

!    allocate ( r(1:dim_num) )

  !  write ( *, '(a)' ) ' '
  !  write ( *, '(a,i8)' ) '  Using dimension DIM_NUM =   ', dim_num

    seed = 0

   ! write ( *, '(a)' ) ' '
   ! write ( *, '(a)' ) '      Seed      Seed      I8_SOBOL'
   ! write ( *, '(a)' ) '        In       Out   (First 2, Last 2)'
   ! write ( *, '(a)' ) ' '

    do i = 1,npts

      seed_in = seed
      call i8_sobol ( dim_num, seed, r )
      seed_out = seed
!      write ( *, '(2x,i8,2x,i8,2x,4f12.6)' ) &
!        seed_in, seed_out, r(1:2), r(dim_num-1:dim_num)
      rmat(1:dim_max,i)=r(1:dim_max)

    end do

!!$    seed = 100000
!!$
!!$    do i = 11, 15
!!$
!!$      seed_in = seed
!!$      call i8_sobol ( dim_num, seed, r )
!!$      seed_out = seed
!!$      write ( *, '(2x,i8,2x,i8,2x,4f12.6)' ) &
!!$        seed_in, seed_out, r(1:2), r(dim_num-1:dim_num)
!!$
!!$    end do
!!$
!!$    deallocate ( r )
!!$
!!$  end do

  return
end subroutine sobol_real
