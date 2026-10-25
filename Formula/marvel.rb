class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.174731.feddf6f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174731-feddf6f/marvel-darwin-arm64"
    sha256 "a59a75bc651255881ef9ad6de9893ee42b499c14a2301ac33b121ee617335d60"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174731-feddf6f/marvel-darwin-amd64"
    sha256 "fd9cef4b514d93db7c7dc782a76311860a18ae7ada7088a52c53285a2b3cd705"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174731-feddf6f/marvel-linux-arm64"
    sha256 "621e06fc2137fc387fccc1e3949db08120d1cfd303712387ca6646c7821f962d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174731-feddf6f/marvel-linux-amd64"
    sha256 "4e55c81a3a9fa0396e3609d6ecc43cb7f4a09dce293d189b2c75d862a82255fe"
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
