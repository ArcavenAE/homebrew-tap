class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260512.134801.26a79c7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260512-134801-26a79c7/marvel-darwin-arm64"
    sha256 "5e4b73a18427ef4d19343af0bc11b1aaf480931d24e15edaa0ccb186b863fb2e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260512-134801-26a79c7/marvel-darwin-amd64"
    sha256 "07dd37bd06ae260154ea771282a4695a8f83d35decdc90e15d7d9634bf0781ed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260512-134801-26a79c7/marvel-linux-arm64"
    sha256 "76266953a28ab079e8f382cef8e0d40265cee56271b7ea3d9f6ce7c1827ab6bf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260512-134801-26a79c7/marvel-linux-amd64"
    sha256 "14eccf7ced4fbfffc5dc87ebf2ea269dcbb57efb3515254d985757ea42658b30"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
