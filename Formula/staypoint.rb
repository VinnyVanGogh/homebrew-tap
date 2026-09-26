class Staypoint < Formula
  desc "Autonomous AI Agent Ops, Quota Pacing & Cross-AI Context Platform"
  homepage "https://github.com/VinnyVanGogh/agent-mesh"
  version "0.1.0"
  license "Apache-2.0"
  head "https://github.com/VinnyVanGogh/agent-mesh.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/VinnyVanGogh/agent-mesh/releases/download/v0.1.0/agent-mesh_0.1.0_darwin_arm64.tar.gz"
      sha256 "d95e984855edb745adba3f349c68db6bd8e86d17e52b5feb4cc32ded41093e99"
    else
      url "https://github.com/VinnyVanGogh/agent-mesh/releases/download/v0.1.0/agent-mesh_0.1.0_darwin_amd64.tar.gz"
      sha256 "9f4099779682814b9ecbc31c8f5c6b80e2d7653785e43cb858a41d7271bfaa99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/VinnyVanGogh/agent-mesh/releases/download/v0.1.0/agent-mesh_0.1.0_linux_arm64.tar.gz"
      sha256 "8bacc689bfec2bc802882ff2e125ec0fabd19a5fe4e7aa18c32a268e37774924"
    else
      url "https://github.com/VinnyVanGogh/agent-mesh/releases/download/v0.1.0/agent-mesh_0.1.0_linux_amd64.tar.gz"
      sha256 "5ae26685b6ac865d38854ea8ead5fd058a5e2745724d38410ecff70cc620ab0a"
    end
  end

  def install
    if build.head?
      system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/staypoint"
      system "go", "build", "-o", bin/"staypointd", "-ldflags", "-s -w", "./cmd/staypointd"
    else
      if File.exist?("staypoint")
        bin.install "staypoint"
        bin.install "staypointd" if File.exist?("staypointd")
      elsif File.exist?("mesh")
        bin.install "mesh" => "staypoint"
        bin.install "meshd" => "staypointd" if File.exist?("meshd")
      end
    end

    # Symlink backward compatibility aliases
    bin.install_symlink "staypoint" => "mesh"
    bin.install_symlink "staypointd" => "meshd" if (bin/"staypointd").exist?
  end

  def caveats
    <<~EOS
      StayPoint (formerly Agent-Mesh) installed successfully!

      To enable shell aliases and automatic model routing, add this to your ~/.zshrc:
        eval "$(staypoint init --shell)"

      To start the background telemetry and rate-limit watcher daemon:
        staypoint init
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/staypoint version 2>&1 || #{bin}/mesh version 2>&1")
  end
end
