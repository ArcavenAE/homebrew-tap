class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.134925.134cc38"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-134925-134cc38/marvel-darwin-arm64"
    sha256 "6068a5bbdf076646a31e53f7c5245c0e91338ea6d0b2edcc47f7330e6cf3e7c4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-134925-134cc38/marvel-darwin-amd64"
    sha256 "ebf1bbd33b77482b6ddff60e49c539c06a80dee283d57db3827516f19b878306"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-134925-134cc38/marvel-linux-arm64"
    sha256 "4c528e1b55e61a396ea71eab5a9d479352a1692968c40277f4b2f1ce9c45471a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-134925-134cc38/marvel-linux-amd64"
    sha256 "bd48ef22b3b81ab9dcf01afd5c2297d6c57bfc6fd31df2784a57b02b16d9d25c"
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
