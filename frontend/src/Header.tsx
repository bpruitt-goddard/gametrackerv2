import React, { useState } from 'react';
import {
    NavLink as RRNavLink,
} from 'react-router-dom';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
  NavbarText
} from 'reactstrap';

function Header() {
  const [isOpen, setIsOpen] = useState(false);

  const toggle = () => setIsOpen(!isOpen);

  return (
      <div>
            <Navbar color="light" light expand="md">
                <NavbarBrand href="/">Gametracker</NavbarBrand>
                <NavbarToggler onClick={toggle} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav className="mr-auto" navbar>
                        <NavItem>
                            <NavLink tag={RRNavLink} exact to="/games">Games</NavLink>
                      </NavItem>
                      <NavItem>
                            <NavLink tag={RRNavLink} exact to="/players">Players</NavLink>
                      </NavItem>
                      <NavItem>
                            <NavLink tag={RRNavLink} exact to="/sessions">Sessions</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink tag={RRNavLink} exact to="/search">Search</NavLink>
                      </NavItem>
                      <NavItem>
                            <NavLink tag={RRNavLink} exact to="/sessions/new">New Session</NavLink>
                        </NavItem>
                    </Nav>                        
                    <NavbarText>Logged in as TODO</NavbarText>
                </Collapse>
            </Navbar>
    </div>
  );
}

export default Header;