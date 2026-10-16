class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.135254.ffca8e2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135254-ffca8e2/marvel-darwin-arm64"
    sha256 "8265b28b81a6524bff294704f43e8329411138e1c3cead8f2269f113f9f18712"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135254-ffca8e2/marvel-darwin-amd64"
    sha256 "3a1f20be4971cf9f9d4a35ea896a26f04c40aad5428d3f741efaabaeae320e96"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135254-ffca8e2/marvel-linux-arm64"
    sha256 "9613eaef9497dd0ca6f4c59e46086e07016fe6826aeb54767a6cb510682de255"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135254-ffca8e2/marvel-linux-amd64"
    sha256 "f691035b96327a9218cb6a8376d62daf69b302b628f65f0555439eec8416bc7e"
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
