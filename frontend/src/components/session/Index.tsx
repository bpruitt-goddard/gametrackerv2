import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Form from './Form';

function Index() {
    return (
        <div>
            <h2>Sessions</h2>

            <Switch>
                <Route path="/sessions/new" component={Form} />
                <Route
                    render={() => <h2>Select a session!</h2>}
                />
            </Switch>
        </div>
    );
}

export default Index;