class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261023.224518.d3c80fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224518-d3c80fe/marvel-darwin-arm64"
    sha256 "aa696dcffb5f4878ea4ce0ceb0a8e8211501a9672aa08b63d675090f06a03fe1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224518-d3c80fe/marvel-darwin-amd64"
    sha256 "7ba1f8aad44eadac3774100e9d8ed7acb6b15b399e6d97a50fdecd51ca7f7bda"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224518-d3c80fe/marvel-linux-arm64"
    sha256 "1848e24a3da59611920e1d11287676b0e46355b447c5678955f0ae9f6a4440cb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224518-d3c80fe/marvel-linux-amd64"
    sha256 "f58045d2b5617d472f123f4fa9df8552d945f777d7255c3f2f5861f71aaf5477"
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
