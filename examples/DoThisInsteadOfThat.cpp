#include <gmock/gmock.h>
#include <gtest/gtest.h>

class TestMock {
public:
    TestMock() = default;
    MOCK_CONST_METHOD0(foo, void());
};

TEST(TheExample1, ExampleTest) {
    testing::StrictMock<TestMock> tt;
    EXPECT_CALL(tt, foo()).Times(10);

    tt.foo();
}
