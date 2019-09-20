Pod::Spec.new do |s|
    s.name             = 'RxDefaultsRelay'
    s.version          = '1.1.1'
    s.summary          = 'Reactive API library written in Swift'
    s.homepage         = 'https://github.com/martindaum/RxDefaultsRelay'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'martindaum' => 'office@martindaum.com' }
    s.source           = { :git => 'https://github.com/martindaum/RxDefaultsRelay.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    
    s.source_files = 'RxDefaultsRelay/Classes/**/*'
    s.swift_version = '5.0'
    s.dependency 'RxSwift', '~> 5.0'
    s.dependency 'RxRelay', '~> 5.0'
end
