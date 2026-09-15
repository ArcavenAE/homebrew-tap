class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.043553.ac6aa87"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-043553-ac6aa87/marvel-darwin-arm64"
    sha256 "f7a4bc8c7156bc8736cbf3e80c9e40eeae1a9e25bc0d6b8cacc6d78bd53d2f93"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-043553-ac6aa87/marvel-darwin-amd64"
    sha256 "ce97f02779f63598c9fbc748c3f6945442f24cf8e524889e24f1d77a10bb6ee2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-043553-ac6aa87/marvel-linux-arm64"
    sha256 "81ca3ead2f7ceffb9572d3aa48b68860b65dcdbc5c2086fc30387926e0fc015f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-043553-ac6aa87/marvel-linux-amd64"
    sha256 "947b90a502c55a588db9cb0f9f7cb106e1af2204b70c984f827bf306dd50d96b"
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
