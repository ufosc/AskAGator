import { IUser } from "../../models/user";

export function loginAct(user: IUser) {
  return {
    type: AUTH_ACTIONS.LOGIN_ACT,
    user,
  };
}

export function logoutAct() {
  return {
    type: AUTH_ACTIONS.LOGOUT_ACT,
  };
}

export function editNameAct(firstName:any, lastName:any) {
    return {
        type: AUTH_ACTIONS.EDIT_NAME_ACT,
        firstName,
        lastName
    };
}

export const AUTH_ACTIONS = {
    LOGIN_ACT: "LOGIN-ACT",
    LOGOUT_ACT: "LOGOUT-ACT",
    EDIT_NAME_ACT: "EDIT-NAME-ACT"
};
