class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.131857.fb5fd77"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-131857-fb5fd77/marvel-darwin-arm64"
    sha256 "4cb4adb219ba8aa1b2d6c47018fb378abf4b678f86aaf298c090c179fe3d78fb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-131857-fb5fd77/marvel-darwin-amd64"
    sha256 "5c8b570a8e8e7f3d7f6ece31dd06ec1af0de8499879e8c5b9a89d02cca8305ae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-131857-fb5fd77/marvel-linux-arm64"
    sha256 "0d73df7b29de752c21b674c1539129bb41693c9374950521a48955cc11b06d7a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-131857-fb5fd77/marvel-linux-amd64"
    sha256 "6fa8123305a6ab77acc9166a9309a1527316147a9e2dd1f5311a8567068ae90e"
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
