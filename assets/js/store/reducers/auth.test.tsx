import { AUTH_ACTIONS } from "../actions/auth";
import auth from './auth';

describe('store.reducers.auth', () => {
    it('should return a default state', () => {
        expect(auth(undefined, {})).toEqual([]);
    });

    it('should return an exists false dict on logout', () => {
        expect(
            auth([], {
                type: AUTH_ACTIONS.LOGOUT_ACT
            })
        ).toEqual({
                exists: false
        });
    });

    it('should change the auth state to the user passed for login', () => {
        expect(
            auth([], {
                type: AUTH_ACTIONS.LOGIN_ACT,
                user: {
                    exists: true,
                    name: 'hunter',
                },
            })
        ).toEqual({
                exists: true,
                name: 'hunter',
        });
    });
});
