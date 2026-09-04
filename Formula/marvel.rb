class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.161833.fb3c6a5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161833-fb3c6a5/marvel-darwin-arm64"
    sha256 "cd4b698eb71d36e552aaab8c98b8a82b9312b0493ed94d626f3cfae53db93999"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161833-fb3c6a5/marvel-darwin-amd64"
    sha256 "7b5d79a32639d4d1f5dff0d54e0e46e39117fb0aecf795bba5a3b0082cd34ac8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161833-fb3c6a5/marvel-linux-arm64"
    sha256 "3fadc33afab0105e48df20f1f7c4b49f78f03036164fad0c96e535e3433dbc38"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161833-fb3c6a5/marvel-linux-amd64"
    sha256 "139d55c03f189e534baf63414ba8ceeae1ba1811067e41240fa5fcbf8074def0"
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
