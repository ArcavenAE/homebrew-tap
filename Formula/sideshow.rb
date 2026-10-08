class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.051810.0ce3fc6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051810-0ce3fc6/sideshow-darwin-arm64"
    sha256 "18d3e058f9f615b8ba9fba1aeb3b6f682e5d4a03598d8330fb74fc749ca5b21f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051810-0ce3fc6/sideshow-darwin-amd64"
    sha256 "091b4dd3ae55041722f739b96f131b9b9c92d2fa875adb028688b9578c3847d2"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051810-0ce3fc6/sideshow-linux-amd64"
    sha256 "205b8bebd7b49f5f93f5d43711967e8fcdd2abe6f928e9ec32078b767380017b"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
