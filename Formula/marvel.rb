class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.034119.2bd6d2d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-034119-2bd6d2d/marvel-darwin-arm64"
    sha256 "7d878506208b5929dd51460cdc0f056b284ddf4d54e15d2e2c023565494914d1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-034119-2bd6d2d/marvel-darwin-amd64"
    sha256 "aa34c9d7984b944fc2765e22c54fd490ed8ea7fc9be79c92d2dd59a3ad0712cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-034119-2bd6d2d/marvel-linux-arm64"
    sha256 "1945f12123ac7fb1a730d6200a5044d8dfebdc379ea77f91e874edf226c76c4b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-034119-2bd6d2d/marvel-linux-amd64"
    sha256 "379d330c55c8417d84cd494f4679c17994e5d85e57eee85682e1f54ee957e73d"
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
