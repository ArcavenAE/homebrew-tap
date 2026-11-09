class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.215000.13bc418"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-215000-13bc418/marvel-darwin-arm64"
    sha256 "eec352c797986c8e8f798ffe1723ab6325869e377d6b97fa9e610ea983fe6874"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-215000-13bc418/marvel-darwin-amd64"
    sha256 "57f4e5cb4187279afbebf5ab707d9d41aab74ac9b0ce9d14fc5b7f7a22f71889"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-215000-13bc418/marvel-linux-arm64"
    sha256 "1e6225b1b4630b29fa330b0bf1cf54484f6bfc36f3856b2cc8f29af8b1545667"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-215000-13bc418/marvel-linux-amd64"
    sha256 "7069b8111cef661cac71994fa5f43c32a35c8f8ffec5357c337375c8e95a4067"
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
