def test_list(high_to_low_list, test_num):
    for high_num in high_to_low_list:
        sum = test_num + high_num
        if sum == 2020:
            return [test_num, high_num]
        elif sum < 2020:
            return None

if __name__ == '__main__':
    with open ('input.txt', 'r') as inputfile:
        numbers = inputfile.readlines()

    numbers = [int(num) for num in numbers]
    low_high = numbers.copy()
    high_low = numbers.copy()

    low_high.sort()
    high_low.sort(reverse=True)

    for low_num in low_high:
        retval = test_list(high_low, low_num)
        if retval is not None:
            retval += [retval[0] * retval[1]]
            print("Solution is {}, {}, mutliplied are {}".format(*retval))
            break
