require 'test_helper'

class MechanicsTest < Test
  
  teardown do
    AmazonProductAPI.reset_default_options
  end
  
  test 'locales' do
    assert_equal 'com', AmazonProductAPI::LOCALES[:us]
  end
  
  test 'domain' do
    assert_equal 'webservices.amazon.com', AmazonProductAPI.domain
  end
  
  test 'url' do
    assert_equal 'http://webservices.amazon.com/onca/xml', AmazonProductAPI.url
  end
  
  test 'set configuration' do
    AmazonProductAPI.set({ locale: :uk, aws_access_key: '123' })
    params = AmazonProductAPI.instance_variable_get('@default_options')
    assert_equal '123', params[:AWSAccessKeyId]
    assert_equal 'webservices.amazon.co.uk', AmazonProductAPI.domain
  end
  
  test 'timestamp' do
    assert_match /\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\dZ/, AmazonProductAPI.timestamp
  end
  
  test 'default options' do
    AmazonProductAPI.set({ associate_tag: 'test-20' })
    defaults = {
      Service: 'AWSECommerceService',
      Version: '2011-08-01',
      AssociateTag: 'test-20'
    }
    assert_equal defaults, AmazonProductAPI.defaults
  end
  
end