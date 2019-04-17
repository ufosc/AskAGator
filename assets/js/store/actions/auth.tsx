import { User } from "../../models/user";

export function loginAct(user : User) {
    return {
        type: AUTH_ACTIONS.LOGIN_ACT,
        user
    };
}

export function logoutAct() {
    return {
        type: AUTH_ACTIONS.LOGOUT_ACT,
    };
}

export function editProfileAct(user : User) {
  return {
      type: AUTH_ACTIONS.EDIT_PROFILE_ACT,
      user
  };
}

export const AUTH_ACTIONS = {
    LOGIN_ACT: "LOGIN-ACT",
    LOGOUT_ACT: "LOGOUT-ACT",
    EDIT_PROFILE_ACT: "EDIT-PROFILE-ACT"
};
