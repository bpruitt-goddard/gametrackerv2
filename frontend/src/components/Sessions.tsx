import React from 'react';
import { Route, Switch } from 'react-router-dom';
import NewSession from './NewSession';

function Sessions() {
    return (
        <div>
            <h2>Sessions</h2>

            <Switch>
                <Route path="/sessions/new" component={NewSession} />
                <Route
                    render={() => <h2>Select a session!</h2>}
                />
            </Switch>
        </div>
    );
}

export default Sessions;