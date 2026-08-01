class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.025012.77b82f3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-025012-77b82f3/sideshow-darwin-arm64"
    sha256 "22ddef15bbe6e23d445dd6900a7e714bb4f67136cffa446faf42d7af169a1471"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-025012-77b82f3/sideshow-darwin-amd64"
    sha256 "4a4438cc5be14231f13359f7bcc25c9ec78c669a1d93bc3f330694b4fff1ab94"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-025012-77b82f3/sideshow-linux-amd64"
    sha256 "6e177e44e9ede38798f11ea7088adc6d2a0277ea093f9d14b233a9740a8eb306"
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
