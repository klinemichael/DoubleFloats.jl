@testset "legacy" begin
  
if VERSION < v"1.1"
    @test Base.Printf.fix_dec(Double64(123.4567), 2) == (5, 3, false)
    @test Base.Printf.fix_dec(Double64(-12.34567), 10) == (7, 2, true)
    @test Base.Printf.ini_dec(Double64(0.1234567), 3) == (3, 0, false)
    @test Base.Printf.ini_dec(Double64(-1234.567), 10) == (10, 4, true)
elseif VERSION < v"1.5"
    digits = Base.Grisu.getbuf()
    @test Printf.fix_dec(Double64(123.4567), 2, digits) == (5, 3, false)
    @test Printf.fix_dec(Double64(-12.34567), 10, digits) == (7, 2, true)
    @test Printf.ini_dec(Double64(0.1234567), 3, digits) == (3, 0, false)
    @test Printf.ini_dec(Double64(-1234.567), 10, digits) == (10, 4, true)
end

@test @sprintf("%f", Double64(3)) == "3.000000"
  
end
