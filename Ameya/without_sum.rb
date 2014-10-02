def test_sum_with_loop
    array = [1, 2, 3, 4]
    sum = 0
    for i in 0...array.length do
        sum += array[i]
    end
    assert_equal(10, sum)
end