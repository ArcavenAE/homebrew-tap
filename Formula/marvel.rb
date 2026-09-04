class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.173444.deadd7e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-173444-deadd7e/marvel-darwin-arm64"
    sha256 "4857e459256b67984e830bc336c61a5889c4bfa351a3844ce7b838b18d6a9d5f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-173444-deadd7e/marvel-darwin-amd64"
    sha256 "0472dfca4b0bd120d3e1d4a41c93f2f0089684e7809b42eee486b84c44450e57"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-173444-deadd7e/marvel-linux-arm64"
    sha256 "06feb89c47a7dfd728b380226031ac5795f1f298ab110268723007797003e0bb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-173444-deadd7e/marvel-linux-amd64"
    sha256 "da6f4f1927bc6bc0d2a1a3c4110097c5f85962bdd219680eda559fcad4e55436"
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
