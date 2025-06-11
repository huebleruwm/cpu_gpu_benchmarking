program loop_benchmarks
    implicit none

    integer :: n1, n2, n3, i
    real :: t_start, t_end

    ! Define loop sizes
    n1 = 1000000      ! 1D
    n2 = 1000         ! 2D
    n3 = 100          ! 3D

    do i = 1, 10
        ! 1D benchmark
        call cpu_time(t_start)
        call benchmark_1D(n1)
        call cpu_time(t_end)
        print *, "1D loop time (size =", n1, "):", t_end - t_start, "seconds"

        ! 2D benchmark
        call cpu_time(t_start)
        call benchmark_2D(n2, n2)
        call cpu_time(t_end)
        print *, "2D loop time (size =", n2, "x", n2, "):", t_end - t_start, "seconds"

        ! 3D benchmark
        call cpu_time(t_start)
        call benchmark_3D(n3, n3, n3)
        call cpu_time(t_end)
        print *, "3D loop time (size =", n3, "x", n3, "x", n3, "):", t_end - t_start, "seconds"
    end do

end program loop_benchmarks


subroutine benchmark_1D(n)
    integer, intent(in) :: n
    real, allocatable :: a(:), b(:), c(:)
    integer :: i

    allocate(a(n), b(n), c(n))
    a = 1.0
    b = 2.0
    
    !$acc data copyin(a,b) copyout(c)

    !$acc parallel loop
    do i = 1, n
        c(i) = a(i) + b(i)
    end do

    !$acc end data

    deallocate(a, b, c)
end subroutine benchmark_1D


subroutine benchmark_2D(n1, n2)
    integer, intent(in) :: n1, n2
    real, allocatable :: a(:,:), b(:,:), c(:,:)
    integer :: i, j

    allocate(a(n1, n2), b(n1, n2), c(n1, n2))
    a = 1.0
    b = 2.0
    
    !$acc data copyin(a,b) copyout(c)

    !$acc parallel loop
    do j = 1, n2
        do i = 1, n1
            c(i,j) = a(i,j) + b(i,j)
        end do
    end do

    !$acc end data

    deallocate(a, b, c)
end subroutine benchmark_2D


subroutine benchmark_3D(n1, n2, n3)
    integer, intent(in) :: n1, n2, n3
    real, allocatable :: a(:,:,:), b(:,:,:), c(:,:,:)
    integer :: i, j, k

    allocate(a(n1, n2, n3), b(n1, n2, n3), c(n1, n2, n3))
    a = 1.0
    b = 2.0

    !$acc data copyin(a,b) copyout(c)

    !$acc parallel loop
    do k = 1, n3
        do j = 1, n2
            do i = 1, n1
                c(i,j,k) = a(i,j,k) + b(i,j,k)
            end do
        end do
    end do

    !$acc end data

    deallocate(a, b, c)
end subroutine benchmark_3D
