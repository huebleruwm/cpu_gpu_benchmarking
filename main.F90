program add_arrays
  implicit none
  integer, parameter :: dp = kind(1.0d0)
integer :: i, j, iter
integer :: clock_start, clock_end, clock_rate
  real(dp) :: elapsed_time
real(dp), allocatable, dimension(:,:) :: var1
  real(dp), allocatable, dimension(:,:) :: var2
  real(dp), allocatable, dimension(:,:) :: var3
  real(dp), allocatable, dimension(:,:) :: var4
  real(dp), allocatable, dimension(:,:) :: var5
  real(dp), allocatable, dimension(:,:) :: var6
  real(dp), allocatable, dimension(:,:) :: var7
  real(dp), allocatable, dimension(:,:) :: var8
  real(dp), allocatable, dimension(:,:) :: var9
  real(dp), allocatable, dimension(:,:) :: var10
  real(dp), allocatable, dimension(:,:) :: var11
  real(dp), allocatable, dimension(:,:) :: var12
  real(dp), allocatable, dimension(:,:) :: var13
  real(dp), allocatable, dimension(:,:) :: var14
  real(dp), allocatable, dimension(:,:) :: var15
  real(dp), allocatable, dimension(:,:) :: var16
  real(dp), allocatable, dimension(:,:) :: var17
  real(dp), allocatable, dimension(:,:) :: var18
  real(dp), allocatable, dimension(:,:) :: var19
  real(dp), allocatable, dimension(:,:) :: var20
  real(dp), allocatable, dimension(:,:) :: var21
  real(dp), allocatable, dimension(:,:) :: var22
  real(dp), allocatable, dimension(:,:) :: var23
  real(dp), allocatable, dimension(:,:) :: var24
  real(dp), allocatable, dimension(:,:) :: var25
  real(dp), allocatable, dimension(:,:) :: var26
  real(dp), allocatable, dimension(:,:) :: var27
  real(dp), allocatable, dimension(:,:) :: var28
  real(dp), allocatable, dimension(:,:) :: var29
  real(dp), allocatable, dimension(:,:) :: var30
  real(dp), allocatable, dimension(:,:) :: var31
  real(dp), allocatable, dimension(:,:) :: var32
  real(dp), allocatable, dimension(:,:) :: var33
  real(dp), allocatable, dimension(:,:) :: var34
  real(dp), allocatable, dimension(:,:) :: var35
  real(dp), allocatable, dimension(:,:) :: var36
  real(dp), allocatable, dimension(:,:) :: var37
  real(dp), allocatable, dimension(:,:) :: var38
  real(dp), allocatable, dimension(:,:) :: var39
  real(dp), allocatable, dimension(:,:) :: var40
  real(dp), allocatable, dimension(:,:) :: var41
  real(dp), allocatable, dimension(:,:) :: var42
  real(dp), allocatable, dimension(:,:) :: var43
  real(dp), allocatable, dimension(:,:) :: var44
  real(dp), allocatable, dimension(:,:) :: var45
  real(dp), allocatable, dimension(:,:) :: var46
  real(dp), allocatable, dimension(:,:) :: var47
  real(dp), allocatable, dimension(:,:) :: var48
  real(dp), allocatable, dimension(:,:) :: var49
  real(dp), allocatable, dimension(:,:) :: var50
  real(dp), allocatable, dimension(:,:) :: final_result
integer :: ni, nj, iterations
  namelist /dims/ ni, nj, iterations
  open(unit=10, file='dims.nml')
  read(10, nml=dims)

  ! Allocate and initialize variables
allocate(var1(ni, nj))
  call random_number(var1)
  allocate(var2(ni, nj))
  call random_number(var2)
  allocate(var3(ni, nj))
  call random_number(var3)
  allocate(var4(ni, nj))
  call random_number(var4)
  allocate(var5(ni, nj))
  call random_number(var5)
  allocate(var6(ni, nj))
  call random_number(var6)
  allocate(var7(ni, nj))
  call random_number(var7)
  allocate(var8(ni, nj))
  call random_number(var8)
  allocate(var9(ni, nj))
  call random_number(var9)
  allocate(var10(ni, nj))
  call random_number(var10)
  allocate(var11(ni, nj))
  call random_number(var11)
  allocate(var12(ni, nj))
  call random_number(var12)
  allocate(var13(ni, nj))
  call random_number(var13)
  allocate(var14(ni, nj))
  call random_number(var14)
  allocate(var15(ni, nj))
  call random_number(var15)
  allocate(var16(ni, nj))
  call random_number(var16)
  allocate(var17(ni, nj))
  call random_number(var17)
  allocate(var18(ni, nj))
  call random_number(var18)
  allocate(var19(ni, nj))
  call random_number(var19)
  allocate(var20(ni, nj))
  call random_number(var20)
  allocate(var21(ni, nj))
  call random_number(var21)
  allocate(var22(ni, nj))
  call random_number(var22)
  allocate(var23(ni, nj))
  call random_number(var23)
  allocate(var24(ni, nj))
  call random_number(var24)
  allocate(var25(ni, nj))
  call random_number(var25)
  allocate(var26(ni, nj))
  call random_number(var26)
  allocate(var27(ni, nj))
  call random_number(var27)
  allocate(var28(ni, nj))
  call random_number(var28)
  allocate(var29(ni, nj))
  call random_number(var29)
  allocate(var30(ni, nj))
  call random_number(var30)
  allocate(var31(ni, nj))
  call random_number(var31)
  allocate(var32(ni, nj))
  call random_number(var32)
  allocate(var33(ni, nj))
  call random_number(var33)
  allocate(var34(ni, nj))
  call random_number(var34)
  allocate(var35(ni, nj))
  call random_number(var35)
  allocate(var36(ni, nj))
  call random_number(var36)
  allocate(var37(ni, nj))
  call random_number(var37)
  allocate(var38(ni, nj))
  call random_number(var38)
  allocate(var39(ni, nj))
  call random_number(var39)
  allocate(var40(ni, nj))
  call random_number(var40)
  allocate(var41(ni, nj))
  call random_number(var41)
  allocate(var42(ni, nj))
  call random_number(var42)
  allocate(var43(ni, nj))
  call random_number(var43)
  allocate(var44(ni, nj))
  call random_number(var44)
  allocate(var45(ni, nj))
  call random_number(var45)
  allocate(var46(ni, nj))
  call random_number(var46)
  allocate(var47(ni, nj))
  call random_number(var47)
  allocate(var48(ni, nj))
  call random_number(var48)
  allocate(var49(ni, nj))
  call random_number(var49)
  allocate(var50(ni, nj))
  call random_number(var50)
  allocate(final_result(ni, nj))
  final_result = 0.0_dp

!$acc data copyin(var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, &
  !$acc var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24, var25, &
  !$acc var26, var27, var28, var29, var30, var31, var32, var33, var34, var35, var36, var37, var38, &
  !$acc var39, var40, var41, var42, var43, var44, var45, var46, var47, var48, var49, &
  !$acc var50) copyout(final_result)
  call system_clock(clock_start, clock_rate)

  do iter = 1, iterations
  ! Loop 1: final_result += var49 * var46
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var37(i, j) - var8(i, j)) - var27(i, j)) / var32(i, j)) + var32(i, j))
  end do
  end do
  ! Loop 2: final_result += var1 * var24
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((var13(i, j) / var41(i, j)) / var11(i, j)) * var33(i, j)) * var34(i, j)) / var49(i, j))
  end do
  end do
  ! Loop 3: final_result += var10 * var7
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var4(i, j) / var17(i, j)) / var40(i, j)) - var37(i, j)) + var37(i, j)) / var14(i, j)) - var12(i, j)) * var24(i, j)) / var50(i, j))
  end do
  end do
  ! Loop 4: final_result += var49 * var1
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var4(i, j)
  end do
  end do
  ! Loop 5: final_result += var15 * var14
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var23(i, j) - var8(i, j)) / var42(i, j)) + var24(i, j)) - var28(i, j))
  end do
  end do
  ! Loop 6: final_result += var34 * var44
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var43(i, j) / var44(i, j)) - var24(i, j))
  end do
  end do
  ! Loop 7: final_result += var26 * var35
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var31(i, j) - var40(i, j)) - var46(i, j)) * var35(i, j)) + var22(i, j))
  end do
  end do
  ! Loop 8: final_result += var1 * var12
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var22(i, j) / var3(i, j)) / var28(i, j)) + var7(i, j)) + var32(i, j)) * var13(i, j)) - var23(i, j)) - var43(i, j)) + var26(i, j)) / var7(i, j))
  end do
  end do
  ! Loop 9: final_result += var42 * var41
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var18(i, j) + var19(i, j)) + var9(i, j)) * var44(i, j)) / var5(i, j)) * var1(i, j)) + var3(i, j))
  end do
  end do
  ! Loop 10: final_result += var39 * var30
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var36(i, j) * var31(i, j)) * var41(i, j)) / var36(i, j)) * var3(i, j)) * var42(i, j)) / var23(i, j))
  end do
  end do
  ! Loop 11: final_result += var5 * var42
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var43(i, j) / var6(i, j))
  end do
  end do
  ! Loop 12: final_result += var46 * var44
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var39(i, j) + var49(i, j))
  end do
  end do
  ! Loop 13: final_result += var30 * var1
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var20(i, j) - var45(i, j)) - var26(i, j)) / var33(i, j)) / var43(i, j)) / var14(i, j)) + var22(i, j))
  end do
  end do
  ! Loop 14: final_result += var50 * var8
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var43(i, j)
  end do
  end do
  ! Loop 15: final_result += var27 * var21
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var25(i, j) + var3(i, j)) / var37(i, j))
  end do
  end do
  ! Loop 16: final_result += var35 * var9
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var21(i, j)
  end do
  end do
  ! Loop 17: final_result += var24 * var30
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var17(i, j)
  end do
  end do
  ! Loop 18: final_result += var39 * var33
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var46(i, j) * var15(i, j)) / var2(i, j)) * var50(i, j)) + var21(i, j)) * var42(i, j)) / var43(i, j)) * var34(i, j))
  end do
  end do
  ! Loop 19: final_result += var12 * var25
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var31(i, j) / var22(i, j)) * var42(i, j)) / var39(i, j)) - var16(i, j)) - var49(i, j)) + var2(i, j)) / var13(i, j)) * var24(i, j))
  end do
  end do
  ! Loop 20: final_result += var9 * var48
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var12(i, j)
  end do
  end do
  ! Loop 21: final_result += var16 * var6
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var31(i, j) + var8(i, j)) - var30(i, j)) + var27(i, j))
  end do
  end do
  ! Loop 22: final_result += var40 * var34
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var28(i, j) - var6(i, j))
  end do
  end do
  ! Loop 23: final_result += var27 * var23
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((var49(i, j) + var37(i, j)) * var10(i, j)) / var33(i, j)) - var36(i, j)) - var15(i, j))
  end do
  end do
  ! Loop 24: final_result += var34 * var13
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((var16(i, j) - var42(i, j)) - var12(i, j)) * var8(i, j)) + var6(i, j)) + var42(i, j))
  end do
  end do
  ! Loop 25: final_result += var11 * var41
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var28(i, j) + var14(i, j)) - var49(i, j)) - var46(i, j)) - var21(i, j)) + var13(i, j)) - var50(i, j)) - var46(i, j)) - var9(i, j)) / var31(i, j))
  end do
  end do
  ! Loop 26: final_result += var20 * var18
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var39(i, j) * var16(i, j)) + var34(i, j))
  end do
  end do
  ! Loop 27: final_result += var49 * var19
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((var2(i, j) - var29(i, j)) + var7(i, j)) - var2(i, j)) + var12(i, j)) + var41(i, j))
  end do
  end do
  ! Loop 28: final_result += var15 * var44
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var47(i, j) / var19(i, j)) * var28(i, j)) + var17(i, j))
  end do
  end do
  ! Loop 29: final_result += var6 * var42
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var2(i, j) + var10(i, j)) * var15(i, j)) / var35(i, j)) * var15(i, j)) / var28(i, j)) + var20(i, j)) / var15(i, j)) + var49(i, j)) - var33(i, j))
  end do
  end do
  ! Loop 30: final_result += var44 * var24
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var37(i, j) + var1(i, j)) + var30(i, j))
  end do
  end do
  ! Loop 31: final_result += var34 * var1
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var44(i, j) / var31(i, j)) + var7(i, j)) + var27(i, j)) + var16(i, j)) * var40(i, j)) / var41(i, j)) / var12(i, j)) * var43(i, j))
  end do
  end do
  ! Loop 32: final_result += var21 * var19
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var21(i, j) + var39(i, j)) - var1(i, j)) * var11(i, j))
  end do
  end do
  ! Loop 33: final_result += var27 * var47
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var1(i, j) * var23(i, j)) - var38(i, j)) / var7(i, j)) + var4(i, j))
  end do
  end do
  ! Loop 34: final_result += var37 * var26
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var26(i, j) - var43(i, j)) / var37(i, j)) * var27(i, j)) - var16(i, j))
  end do
  end do
  ! Loop 35: final_result += var49 * var12
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var39(i, j) / var26(i, j)) * var9(i, j)) - var48(i, j)) + var16(i, j)) + var30(i, j)) - var29(i, j)) - var9(i, j)) - var26(i, j)) + var35(i, j))
  end do
  end do
  ! Loop 36: final_result += var12 * var47
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var25(i, j) + var47(i, j)) / var37(i, j)) - var42(i, j)) - var49(i, j)) * var39(i, j)) * var40(i, j)) / var21(i, j)) * var6(i, j))
  end do
  end do
  ! Loop 37: final_result += var20 * var37
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var42(i, j) * var23(i, j)) + var12(i, j)) * var23(i, j)) + var42(i, j)) + var21(i, j)) + var50(i, j)) + var1(i, j)) - var11(i, j))
  end do
  end do
  ! Loop 38: final_result += var13 * var6
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var19(i, j) + var50(i, j)) - var30(i, j)) * var39(i, j)) * var21(i, j)) * var44(i, j)) * var36(i, j))
  end do
  end do
  ! Loop 39: final_result += var3 * var50
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var30(i, j) / var39(i, j)) * var30(i, j)) - var3(i, j)) / var36(i, j)) / var22(i, j)) - var23(i, j)) / var3(i, j)) / var29(i, j)) + var26(i, j))
  end do
  end do
  ! Loop 40: final_result += var44 * var1
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var41(i, j) + var30(i, j)) + var44(i, j)) * var46(i, j)) - var8(i, j)) / var30(i, j)) + var24(i, j)) / var38(i, j))
  end do
  end do
  ! Loop 41: final_result += var33 * var38
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var7(i, j) * var33(i, j))
  end do
  end do
  ! Loop 42: final_result += var14 * var41
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var45(i, j)
  end do
  end do
  ! Loop 43: final_result += var21 * var13
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var31(i, j) - var39(i, j))
  end do
  end do
  ! Loop 44: final_result += var41 * var39
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var48(i, j) * var29(i, j)) - var10(i, j)) - var15(i, j)) / var49(i, j)) - var5(i, j)) * var46(i, j)) + var19(i, j)) + var33(i, j)) + var43(i, j))
  end do
  end do
  ! Loop 45: final_result += var23 * var32
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var2(i, j)
  end do
  end do
  ! Loop 46: final_result += var2 * var26
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var49(i, j) - var15(i, j)) + var18(i, j)) - var43(i, j)) / var46(i, j)) + var45(i, j)) + var24(i, j)) * var41(i, j))
  end do
  end do
  ! Loop 47: final_result += var8 * var28
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var21(i, j) + var9(i, j)) * var13(i, j)) - var24(i, j)) - var21(i, j)) * var22(i, j)) + var44(i, j)) + var18(i, j)) + var49(i, j))
  end do
  end do
  ! Loop 48: final_result += var1 * var7
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var28(i, j) / var42(i, j)) / var40(i, j)) * var19(i, j)) + var38(i, j)) / var35(i, j)) / var2(i, j)) * var41(i, j)) + var41(i, j))
  end do
  end do
  ! Loop 49: final_result += var21 * var50
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var40(i, j) * var28(i, j)) * var12(i, j)) + var15(i, j)) - var8(i, j)) + var32(i, j)) / var10(i, j)) / var1(i, j)) * var6(i, j))
  end do
  end do
  ! Loop 50: final_result += var4 * var43
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var5(i, j)
  end do
  end do
  ! Loop 51: final_result += var35 * var37
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var33(i, j) + var20(i, j)) / var22(i, j)) * var48(i, j))
  end do
  end do
  ! Loop 52: final_result += var19 * var45
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var16(i, j) - var5(i, j)) / var26(i, j)) - var42(i, j)) * var49(i, j)) + var30(i, j)) + var38(i, j)) / var47(i, j))
  end do
  end do
  ! Loop 53: final_result += var36 * var48
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var6(i, j) / var25(i, j)) - var26(i, j)) + var2(i, j)) + var29(i, j)) / var1(i, j)) * var9(i, j))
  end do
  end do
  ! Loop 54: final_result += var34 * var3
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var9(i, j) - var13(i, j)) * var24(i, j)) / var31(i, j))
  end do
  end do
  ! Loop 55: final_result += var34 * var39
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((var45(i, j) - var42(i, j)) - var24(i, j)) * var3(i, j)) + var20(i, j)) - var37(i, j))
  end do
  end do
  ! Loop 56: final_result += var20 * var39
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var30(i, j) / var14(i, j)) / var16(i, j)) + var29(i, j)) + var40(i, j))
  end do
  end do
  ! Loop 57: final_result += var10 * var30
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var28(i, j) / var20(i, j)) * var36(i, j)) / var1(i, j)) - var9(i, j)) + var17(i, j)) + var31(i, j)) - var37(i, j)) + var14(i, j)) - var14(i, j))
  end do
  end do
  ! Loop 58: final_result += var46 * var35
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var6(i, j) * var7(i, j)) / var2(i, j)) + var1(i, j)) + var21(i, j))
  end do
  end do
  ! Loop 59: final_result += var28 * var45
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var1(i, j)
  end do
  end do
  ! Loop 60: final_result += var26 * var14
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var24(i, j) + var20(i, j)) - var42(i, j)) - var7(i, j)) / var22(i, j)) / var16(i, j)) + var8(i, j))
  end do
  end do
  ! Loop 61: final_result += var16 * var37
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var8(i, j) + var8(i, j)) - var10(i, j)) + var12(i, j)) - var36(i, j)) - var35(i, j)) * var11(i, j)) + var7(i, j)) + var20(i, j))
  end do
  end do
  ! Loop 62: final_result += var13 * var40
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var40(i, j) / var2(i, j)) - var1(i, j)) - var33(i, j)) - var26(i, j))
  end do
  end do
  ! Loop 63: final_result += var32 * var18
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var9(i, j) * var11(i, j)) * var18(i, j)) / var30(i, j)) / var18(i, j)) / var48(i, j)) + var28(i, j)) + var14(i, j)) / var41(i, j)) - var5(i, j))
  end do
  end do
  ! Loop 64: final_result += var2 * var5
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var32(i, j) / var48(i, j))
  end do
  end do
  ! Loop 65: final_result += var37 * var19
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var46(i, j) * var32(i, j)) * var40(i, j)) / var41(i, j))
  end do
  end do
  ! Loop 66: final_result += var44 * var23
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var30(i, j) + var26(i, j)) + var11(i, j)) - var50(i, j)) * var30(i, j)) - var6(i, j)) / var44(i, j)) - var30(i, j))
  end do
  end do
  ! Loop 67: final_result += var27 * var28
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var23(i, j) / var17(i, j)) / var49(i, j)) + var40(i, j)) - var24(i, j)) / var43(i, j)) - var21(i, j)) + var10(i, j))
  end do
  end do
  ! Loop 68: final_result += var18 * var21
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var33(i, j) / var48(i, j)) - var38(i, j)) - var27(i, j)) * var28(i, j)) * var33(i, j)) - var31(i, j)) - var16(i, j)) * var4(i, j))
  end do
  end do
  ! Loop 69: final_result += var16 * var14
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var47(i, j)
  end do
  end do
  ! Loop 70: final_result += var25 * var47
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var40(i, j) * var27(i, j)) / var11(i, j)) + var11(i, j)) + var8(i, j)) + var3(i, j)) + var14(i, j)) + var25(i, j)) + var49(i, j))
  end do
  end do
  ! Loop 71: final_result += var26 * var46
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var36(i, j) / var37(i, j)) / var23(i, j)) + var29(i, j)) * var7(i, j)) + var25(i, j)) - var31(i, j)) / var44(i, j))
  end do
  end do
  ! Loop 72: final_result += var27 * var38
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var42(i, j) / var4(i, j)) - var29(i, j)) - var7(i, j)) + var33(i, j)) / var1(i, j)) / var30(i, j)) - var10(i, j)) + var38(i, j)) / var3(i, j))
  end do
  end do
  ! Loop 73: final_result += var16 * var32
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var11(i, j) / var50(i, j)) * var35(i, j)) * var15(i, j)) / var48(i, j)) * var39(i, j)) - var35(i, j)) - var4(i, j)) + var14(i, j)) * var11(i, j))
  end do
  end do
  ! Loop 74: final_result += var17 * var31
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var18(i, j) + var25(i, j)) * var10(i, j)) - var42(i, j)) * var27(i, j)) + var28(i, j)) + var39(i, j)) / var50(i, j)) + var10(i, j)) * var34(i, j))
  end do
  end do
  ! Loop 75: final_result += var31 * var20
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var23(i, j) - var34(i, j)) * var41(i, j)) * var16(i, j))
  end do
  end do
  ! Loop 76: final_result += var8 * var44
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var30(i, j) / var29(i, j)) * var4(i, j)) * var5(i, j)) / var42(i, j)) + var31(i, j)) / var12(i, j)) + var14(i, j)) - var31(i, j)) * var50(i, j))
  end do
  end do
  ! Loop 77: final_result += var10 * var24
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var49(i, j) / var47(i, j)) - var46(i, j))
  end do
  end do
  ! Loop 78: final_result += var22 * var17
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var29(i, j) / var15(i, j)) - var29(i, j)) / var39(i, j)) / var31(i, j)) + var13(i, j)) - var1(i, j)) / var13(i, j)) * var46(i, j))
  end do
  end do
  ! Loop 79: final_result += var46 * var10
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var25(i, j) - var35(i, j)) + var31(i, j)) - var39(i, j)) + var25(i, j)) - var15(i, j)) - var40(i, j))
  end do
  end do
  ! Loop 80: final_result += var25 * var42
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var41(i, j) - var33(i, j)) / var17(i, j)) / var6(i, j)) - var34(i, j)) / var19(i, j)) - var7(i, j)) - var11(i, j))
  end do
  end do
  ! Loop 81: final_result += var32 * var6
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((((var37(i, j) + var22(i, j)) - var43(i, j)) * var3(i, j)) * var37(i, j)) - var4(i, j)) * var45(i, j)) + var3(i, j)) / var27(i, j))
  end do
  end do
  ! Loop 82: final_result += var9 * var5
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var29(i, j) - var48(i, j)) - var48(i, j)) - var34(i, j)) * var36(i, j)) + var20(i, j)) - var19(i, j)) * var8(i, j)) / var46(i, j)) + var15(i, j))
  end do
  end do
  ! Loop 83: final_result += var8 * var15
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var26(i, j) + var18(i, j)) / var40(i, j))
  end do
  end do
  ! Loop 84: final_result += var33 * var2
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var39(i, j) / var8(i, j)) + var8(i, j)) - var38(i, j)) * var7(i, j))
  end do
  end do
  ! Loop 85: final_result += var12 * var39
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var8(i, j) - var26(i, j)) * var48(i, j)) + var10(i, j))
  end do
  end do
  ! Loop 86: final_result += var36 * var33
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var35(i, j) / var48(i, j)) + var38(i, j)) * var40(i, j)) - var26(i, j))
  end do
  end do
  ! Loop 87: final_result += var49 * var30
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var16(i, j) + var35(i, j)) / var23(i, j)) / var8(i, j)) / var25(i, j)) - var7(i, j)) - var22(i, j)) + var31(i, j))
  end do
  end do
  ! Loop 88: final_result += var27 * var45
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var24(i, j) * var40(i, j))
  end do
  end do
  ! Loop 89: final_result += var8 * var15
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((var35(i, j) / var10(i, j)) - var37(i, j)) + var42(i, j))
  end do
  end do
  ! Loop 90: final_result += var49 * var3
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var31(i, j) * var46(i, j)) / var22(i, j)) + var26(i, j)) / var45(i, j)) / var31(i, j)) - var40(i, j))
  end do
  end do
  ! Loop 91: final_result += var20 * var28
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((var22(i, j) - var35(i, j)) / var47(i, j)) + var43(i, j)) / var42(i, j))
  end do
  end do
  ! Loop 92: final_result += var45 * var26
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var41(i, j) * var7(i, j)) / var44(i, j)) / var17(i, j)) - var30(i, j)) * var46(i, j)) - var36(i, j))
  end do
  end do
  ! Loop 93: final_result += var1 * var9
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (var21(i, j) / var25(i, j))
  end do
  end do
  ! Loop 94: final_result += var5 * var38
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((((((var27(i, j) + var7(i, j)) * var11(i, j)) * var6(i, j)) * var16(i, j)) - var26(i, j)) * var44(i, j))
  end do
  end do
  ! Loop 95: final_result += var40 * var41
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + ((var39(i, j) - var7(i, j)) + var7(i, j))
  end do
  end do
  ! Loop 96: final_result += var36 * var25
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var2(i, j)
  end do
  end do
  ! Loop 97: final_result += var16 * var42
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var24(i, j) * var24(i, j)) / var10(i, j)) * var17(i, j)) * var42(i, j)) - var50(i, j)) * var32(i, j)) - var41(i, j)) - var13(i, j)) - var11(i, j))
  end do
  end do
  ! Loop 98: final_result += var24 * var10
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + var47(i, j)
  end do
  end do
  ! Loop 99: final_result += var9 * var6
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((var49(i, j) * var41(i, j)) / var45(i, j)) * var31(i, j)) * var9(i, j)) + var30(i, j)) + var48(i, j)) - var15(i, j))
  end do
  end do
  ! Loop 100: final_result += var12 * var25
!$acc parallel loop collapse(2) default(present) async(1)
  do j = 1, nj
  do i = 1, ni
    final_result(i, j) = final_result(i, j) + (((((((((var26(i, j) + var45(i, j)) - var44(i, j)) + var49(i, j)) * var36(i, j)) + var20(i, j)) / var4(i, j)) + var46(i, j)) - var41(i, j)) + var16(i, j))
  end do
  end do
  end do

  call system_clock(clock_end)
  elapsed_time = real(clock_end - clock_start, dp) / real(clock_rate, dp)
  print *, 'Loop execution time (s):', elapsed_time
  !$acc end data

  ! Compute and print average
  print *, 'Average of final_result =', sum(final_result) / size(final_result)

end program add_arrays