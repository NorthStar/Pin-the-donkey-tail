////
////  PT.m
////  Pin the donkey tail
////
////  Created by Xinlei Xu on 1/25/14.
////  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
////
//
//#import "PT.h"
//#import <Pinterest/Pinterest.h>
//
////Not sure if I need this:
//#import "PTPinterestWrapper.h"
//
//@interface PT () <NSURLConnectionDataDelegate>
//{
//    NSString * clientID;
//}
//
////\TODO: client id OAuth
//
////@property(atomic, strong) NSString * clientID;
//
//@property NSURLConnection * venuesConnection;
//@property NSURLConnection * photosConnection;
//@property NSURLSession * session;
//
//@end
//
//@implementation PT
//
////Macro Consts
//#define BASE_URL @"https://api.pinterest.com/v3/"
//#define USER_AGENT @"Pinterest Client/0.1"
//
///*
//require "cgi"
//require "json"
//require "openssl"
//require "set"
//
//require "httpclient"
//require "httpclient/include_client"
//*/
//
//
///*DEFAULT_HEADERS = {
//    "User-Agent" => USER_AGENT,
//    "Accept-Encoding" => "gzip,deflate"
//}*/
//
///*
//class ApiException < Exception
//attr_accessor :code, :message, :message_detail, :response
//
//def initialize(api_response)
//self.code = api_response.code
//self.message = api_response.envelope['message']
//self.message_detail = api_response.envelope['message_detail']
//end
//end
//
//class ApiResponse
//attr_accessor :code, :envelope, :data, :bookmark
//
//def initialize(response_hash)
//self.code = response_hash['code']
//self.data = response_hash['data']
//self.bookmark = response_hash['bookmark']
//self.envelope = response_hash
//
//raise ApiException.new(self) if self.code and self.code != 0
//end
//end
//*/
//
//- (id) init
//{
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    _session = [NSURLSession sessionWithConfiguration:config];
//    
//    //self.webImageManager = [SDWebImageManager sharedManager];
//    return self;
//}
//
//
//
//#pragma mark - URLs
//- (NSString *)imageSearchURL:(PTPinterestWrapper *)pinView
//{
//    NSString * url = [NSString stringWithFormat:@"%@/oauth/code_exchange/", BASE_URL, clientID];
//    return url;
//}
//
//
///*
//class URLBuilder
//attr_reader :client, :path_components
//extend HTTPClient::IncludeClient
//
//include_http_client(:method_name => "http_client") do |client|
//client.transparent_gzip_decompression = true
//end
//
//def initialize(client, initial_path)
//@client = client
//@path_components = initial_path
//end
//
//def invoke(verb, params)
//params = Hash[params.collect do |(k, value)|
//              value = value.join(",") if value.kind_of? Array
//              [k, value]
//              end]
//
//if self.client.authenticated?
//params[:access_token] = self.client.access_token
//else
//self.sign!(verb, params)
//end
//
//headers = params.delete(:headers) || {}
//headers.update(DEFAULT_HEADERS)
//response = self.http_client.send(verb.to_sym,
//                                 self.endpoint_url,
//                                 :query => params,
//                                 :header => headers)
//response_hash = JSON.parse(response.content)
//ApiResponse.new(response_hash)
//end*/
//
//
//+ (NSString *)fourSquareSearchURLForSearchTerm:(NSString *) searchTerm near:(NSString *)location
//{
//    //    float latitude = location.coordinate.latitude;
//    //    float longitude = location.coordinate.longitude;
//    NSString *url = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?near=%@&query=%@&client_id=%@&client_secret=%@&v=%@", location, searchTerm, CLIENT_ID, CLIENT_SECRET, @"20131123"];
//    NSString *escapedURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    return escapedURL;
//}
//
//
//
//
//def sign!(verb, params)
//if self.client.client_id.nil? or self.client.client_secret.nil?
//raise "The client is not configured! You must set a client id and a secret"
//end
//
//params = {} if params.nil?
//params[:client_id] = self.client.client_id
//params[:timestamp] = Time.now.getutc.to_i.to_s
//
//sig_base = "#{verb.upcase}&#{CGI::escape(self.endpoint_url)}"
//sorted = params.sort { |(k1, _), (k2, _)| k1.to_s <=> k2.to_s }
//sorted_query = sorted.collect { |(k, v)| "#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}" }.join("&")
//sig_base = "#{sig_base}&#{sorted_query}".gsub("%7E", "~")
//params[:oauth_signature] = OpenSSL::HMAC.hexdigest('sha256', self.client.client_secret, sig_base)
//end
//
//def path
//self.path_components.join("/")
//end
//
//def endpoint_url
//"#{BASE_URL}#{self.path}/"
//end
//
//def authenticate!(access_token)
//self.client.authenticate!(access_token)
//end
//
//def method_missing(meth, *args)
//new_path = self.path_components.dup << meth.to_sym
//new_path += args.map(&:to_sym) unless args.empty?
//
//URLBuilder.new(client, new_path)
//end
//
//def to_a
//path_components
//end
//
//[:get, :post, :put, :delete].each do |method_name|
//self.send(:define_method, method_name) do |*args|
//params = args.last.is_a?(Hash) ? args.last : {}
//invoke(method_name, params)
//end
//end
//end
//
//class Client
//attr_accessor :client_id, :client_secret, :access_token
//
//def initialize(client_id=nil, client_secret=nil)
//@client_id = client_id.to_s unless client_id.nil?
//@client_secret = client_secret.to_s unless client_secret.nil?
//end
//
//def authenticate!(access_token)
//@access_token = access_token
//end
//
//def authenticated?
//!@access_token.nil?
//end
//
//def method_missing(method, *args)
//url_pieces = [method]
//url_pieces += args unless args.empty?
//URLBuilder.new(self, url_pieces)
//end
//end
//end
//
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}
//*/
//
//@end
