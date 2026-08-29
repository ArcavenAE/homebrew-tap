class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.002609.f16b5d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002609-f16b5d9/marvel-darwin-arm64"
    sha256 "6b8c3ee58e2413dec070fff7023c277ae2ca4bccf2e1c631955d32d7867581bd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002609-f16b5d9/marvel-darwin-amd64"
    sha256 "7a59885e95496e79eaf9f5a0fad31e213ed78528e8ed7823466cfb7839cf0bdf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002609-f16b5d9/marvel-linux-arm64"
    sha256 "05a7dcac22766c2debcb03ce6644f6faee7c2491a65978aecf4e8f9f016620de"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002609-f16b5d9/marvel-linux-amd64"
    sha256 "da012aa1bb309c2af5506d5d8b69a22fa96a9c37faa00337628cbf3654e84222"
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
