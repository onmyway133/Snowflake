Pod::Spec.new do |s|
  s.name             = "FantasticSnowflake"
  s.summary          = "SVG in Swift"
  s.version          = "2.3.0"
  s.homepage         = "https://github.com/onmyway133/Snowflake"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/Snowflake.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '10.0'

  s.requires_arc = true
  s.ios.source_files = 'Sources/iOS/**/*'
  s.tvos.source_files = 'Sources/iOS/**/*'

  s.dependency 'Reindeers'
  s.swift_version = '5.0'
end
