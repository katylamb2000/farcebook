import React from 'react';
import { connect } from 'react-redux';
import ProfileHeaderNav from './profile_header_nav';

const ProfileHeader = (props) => (
  <div id='profile-header'>
    <h1>Profile Header</h1>
    <ProfileHeaderNav />
  </div>
);

const mapStateToProps = state => ({

});

export default connect(mapStateToProps, null)(ProfileHeader)