#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <thread>

class TestMock {
public:
    TestMock() = default;
    MOCK_CONST_METHOD0(foo, void());
};

TEST(TheExample1, SanitizerCheck) {
    int aa = 0;

    std::thread t1([&aa]{
        aa += 2;
    });

    std::thread t2([&aa]{
        aa -= 3;
    });

    t1.join();
    t2.join();
}

TEST(TheExample1, ExampleTest) {
    testing::StrictMock<TestMock> tt;
    EXPECT_CALL(tt, foo()).Times(10);

    tt.foo();
}
