import * as AuthActions from "./auth";

import { IUser } from "../../models/user";

describe("AuthActions", () => {
  it("should create an action to login a User", () => {
    const user: IUser = {
      email: "test@test.com",
      exists: true,
      firstName: "Test",
      lastName: "Test",
    };
    const expectedAction = {
      type: AuthActions.AUTH_ACTIONS.LOGIN_ACT,
      user,
    };

    expect(AuthActions.loginAct(user)).toStrictEqual(expectedAction);
  });

  it("should create an action to logout a User", () => {
    const expectedAction = {
      type: AuthActions.AUTH_ACTIONS.LOGOUT_ACT,
    };

    expect(AuthActions.logoutAct()).toStrictEqual(expectedAction);
  });
});
