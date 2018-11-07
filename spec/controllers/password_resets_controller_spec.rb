require 'spec_helper'

describe PasswordResetsController do
    describe 'Reset password' do
        it 'should send an email with instructions for resetting password'
        it 'should check the expiration date of the link sent'
        it 'should update users password'