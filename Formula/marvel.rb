class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.093625.ccb118e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-093625-ccb118e/marvel-darwin-arm64"
    sha256 "930b079d87fc28726a5dd53262cf83331f36fd7a11fe35b1bfb2989d004bbf2f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-093625-ccb118e/marvel-darwin-amd64"
    sha256 "8c3fd2b5ef30a0470e75cf3e7b68b881c8b127e3b14502a5333d984ae6c5c117"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-093625-ccb118e/marvel-linux-arm64"
    sha256 "01052d8e2785c7ffa04966a1775376bb7cfbd448fe97ad2c0cf0cd3cb5e61f4d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-093625-ccb118e/marvel-linux-amd64"
    sha256 "452fda7550a0089435e1de56c2598a63c591fee99b2b0899adff114e36c1c3e2"
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
