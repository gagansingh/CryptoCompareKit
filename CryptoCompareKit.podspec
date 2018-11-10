Pod::Spec.new do |s|
  s.name         = "CryptoCompareKit"
  s.version      = "0.0.2"
  s.summary      = "A CryptoCompare API client written in Swift."
  s.description  = <<-DESC
                      CryptoCompareKit is a wrapper for the CryptoCompare API written in swift.
                   DESC

  s.homepage           = "https://github.com/sger/CryptoCompareKit"
  s.license            = { :type => "MIT", :file => "LICENSE" }
  s.authors            = { "Spiros Gerokostas" => "spiros.gerokostas@gmail.com" }
  s.social_media_url   = "http://twitter.com/sger"
  s.source             = { :git => "https://github.com/sger/CryptoCompareKit.git", :tag => "#{s.version}" }
  s.source_files       = 'CryptoCompareKit/*.swift', 'CryptoCompareKit/**/*.swift'
  s.platform           = :ios, '12.0'
  s.swift_version      = "4.2"
end
