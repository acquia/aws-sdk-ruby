# frozen_string_literal: true

require_relative 'spec_helper'
require 'stringio'

module Aws
  module IoTDataPlane
    describe Client do

      it 'requires a region for signing purposes' do
        expect {
          Client.new
        }.to raise_error(Aws::Errors::MissingRegionError)
      end

      it 'can be constructed without an endpoint' do
        expect {
          Client.new(region:'us-west-1')
        }.not_to raise_error
      end

      it 'requires a valid endpoint' do
        expect {
          Client.new(region:'us-west-1', endpoint:'foo')
        }.to raise_error(ArgumentError, "expected :endpoint to be a HTTP or HTTPS endpoint")
      end

      it 'correctly extracts the sigv4 signing region' do
        client = Client.new(
          region: "us-east-1",
          endpoint: "https://FOOBARFOOBAR.iot.us-east-1.amazonaws.com",
          stub_responses: true
        )
        expect_auth({ 'signingRegion' => 'us-east-1' })
        client.get_thing_shadow(thing_name: 'thing')
      end

      it 'correctly extracts the sigv4 signing region outside of us-east-1' do
        client = Client.new(
          region: "eu-west-1",
          endpoint: "https://FOOBARFOOBAR.iot.eu-west-1.amazonaws.com",
          stub_responses: true
        )
        expect_auth({ 'signingRegion' => 'eu-west-1' })
        client.get_thing_shadow(thing_name: 'thing')
      end

      it 'can be constructed with a region and endpoint' do
        expect {
          Client.new(region:'us-west-1', endpoint:'https://foo.com')
        }.not_to raise_error
      end

    end
  end
end
