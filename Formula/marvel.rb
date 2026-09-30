class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.135429.01654d6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-135429-01654d6/marvel-darwin-arm64"
    sha256 "8394efd1bd4f6d42628420cb904d08a31a1ba1f9d12b1cd1b9c25e8195e404e3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-135429-01654d6/marvel-darwin-amd64"
    sha256 "705e7157055d2d7f9fa9b157f55fc1728a840e55b736c7e004054b21af830cd2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-135429-01654d6/marvel-linux-arm64"
    sha256 "af00fc57605062aa0142a8907f498a0dec87b28b207bc3778a1178985df89249"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-135429-01654d6/marvel-linux-amd64"
    sha256 "daf96af3edca43976f6b7195463ef5ab2d75cf22a6abb9c08e9ca852407d75b3"
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
