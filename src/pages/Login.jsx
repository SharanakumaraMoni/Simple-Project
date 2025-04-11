import { Button, Col, Form, Input, notification, Row } from "antd";
import type { FormProps } from "antd";
import { useDispatch } from "react-redux";
import { setUser } from "../redux/slices/userAuth";
import LogoImage from "../assets/logo2.png";

type FieldType = {
  email: string;
  password: string;
};

const Login = () => {
  const dispatch = useDispatch();

  const onFinish: FormProps<FieldType>["onFinish"] = async (
    values: FieldType
  ) => {
    try {
      const expectedPassword = `${values.email.slice(0, 4)}2255`;

      if (values.password === expectedPassword) {
        const user = {
          token: "test",
          userDetails: {
            name: "Bala",
            email: values.email,
          },
        };
        dispatch(setUser(user));
        notification.success({
          message: "Login Successful",
          description: "Welcome back!",
        });
      } else {
        notification.error({
          message: "Login Failed",
          description: "Invalid Credentials",
        });
      }
    } catch (error: any) {
      console.log(error, "Error");
    }
  };

  return (
    <Row style={{ height: "100vh" }}>
      <Col span={12} className="flex justify-center items-center bg-black">
        <img src={LogoImage} alt="nora-ai login image" className="w-[24rem]" />
      </Col>
      <Col span={12} className="flex justify-center items-center">
        <div className="login-form w-[30rem]">
          <Form
            name="basic"
            layout="vertical"
            initialValues={{ remember: true }}
            onFinish={onFinish}
            autoComplete="off"
          >
            <Form.Item<FieldType>
              label="Email"
              name="email"
              rules={[
                { required: true, message: "Please input your email!" },
                { type: "email", message: "Please enter a valid email!" },
              ]}
            >
              <Input />
            </Form.Item>

            <Form.Item<FieldType>
              label="Password"
              name="password"
              rules={[
                { required: true, message: "Please input your password!" },
              ]}
            >
              <Input.Password />
            </Form.Item>
            <Form.Item>
              <Button type="primary" htmlType="submit">
                Submit
              </Button>
            </Form.Item>
          </Form>
        </div>
      </Col>
    </Row>
  );
};

export default Login;
